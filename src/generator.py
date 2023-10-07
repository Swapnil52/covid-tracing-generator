from datetime import timedelta, datetime
from random import randint, sample, uniform
from typing import List, Tuple, Set, Dict

from src.config import Config
from src.entity import Employee, MeetingRoom, Meeting, EmployeeMeeting, Symptom, Scan, Test, Case, Notification, HealthStatus

STATUS_WELL = "WELL"

LOCATION_HOSPITAL = "hospital"

STATUS_SICK = "SICK"

STATUS_BACK_TO_WORK = "BACK_TO_WORK"

TEST_RESULT_NEGATIVE = "NEGATIVE"

TEST_RESULT_POSITIVE = "POSITIVE"

KEY_SYMPTOM_ID = "symptom_id"

KEY_SCAN_ID = "scan_id"

KEY_NOTIFICATION_ID = "notification_id"


class Generator:
    def __init__(self, config: Config):
        self.__config = config
        self.__employees = []
        self.__meeting_rooms = []
        self.__meetings = []
        self.__employee_meetings = []
        self.__notifications = []
        self.__symptoms = []
        self.__scans = []
        self.__tests = []
        self.__cases = []
        self.__health_statuses = []

    def generate(self):
        self.__employees = self.__generate_employees()
        self.__meeting_rooms = self.__generate_meeting_rooms()

    def static_tasks(self):
        self.__employees = self.__generate_employees()
        self.__meeting_rooms = self.__generate_meeting_rooms()

    def dynamic_tasks(self):
        tests = []
        all_employee_ids = {employee.get_id() for employee in self.__employees}
        for day_delta in range(self.__config.num_days):
            # current date is the start date plus
            today = self.__config.start_day + timedelta(days=day_delta)

            sick_employee_ids = {case.get_employee_id() for case in self.__cases if case.get_resolution() == STATUS_SICK}
            healthy_employee_ids = all_employee_ids.difference(sick_employee_ids)

            # overall healthy and sick employees should be mutually exclusive
            assert len(sick_employee_ids.intersection(healthy_employee_ids)) == 0

            # generate meetings and assign them to employees
            meetings, assignments = self.__generate_meetings_for_today(today, healthy_employee_ids)
            self.__meetings.extend(meetings)
            self.__employee_meetings.extend(assignments)

            # generate notifications for the above employees
            mandatory_notifications, optional_notifications = self.__generate_notifications_for_today(today, tests)
            self.__notifications.extend(mandatory_notifications)
            self.__notifications.extend(optional_notifications)

            # generate scans for the healthy employees
            scans = self.__generate_scans_for_today(today, healthy_employee_ids)
            self.__scans.extend(scans)

            # generate symptom reports for healthy employees
            symptoms = self.__generate_symptoms_for_today(today, healthy_employee_ids)
            self.__symptoms.extend(symptoms)

            # generate tests for the notifications, scans and symptoms
            tests = self.__generate_tests_for_today(today, mandatory_notifications, scans, symptoms)
            tests.extend(self.__generate_tests_for_sick_employees(today, sick_employee_ids))
            self.__tests.extend(tests)

            # update cases for each test
            self.__update_cases_for_today(tests)

            # generate health status for sick employees
            health_statuses = self.__generate_health_statuses_for_today(today)
            self.__health_statuses.extend(health_statuses)

    def dump(self):
        with open("./sql/employee.sql", "w") as f:
            for meeting_room in self.__employees:
                f.write("%s\n" % meeting_room.get_insert_query())
        with open("./sql/meeting_room.sql", "w") as f:
            for meeting_room in self.__meeting_rooms:
                f.write("%s\n" % meeting_room.get_insert_query())
        with open("./sql/meeting.sql", "w") as f:
            for meeting in self.__meetings:
                f.write("%s\n" % meeting.get_insert_query())
        with open("./sql/employee_meeting.sql", "w") as f:
            for employee_meeting in self.__employee_meetings:
                f.write("%s\n" % employee_meeting.get_insert_query())
        with open("./sql/scan.sql", "w") as f:
            for scan in self.__scans:
                f.write("%s\n" % scan.get_insert_query())
        with open("./sql/symptom.sql", "w") as f:
            for symptom in self.__symptoms:
                f.write("%s\n" % symptom.get_insert_query())
        with open("./sql/test.sql", "w") as f:
            for test in self.__tests:
                f.write("%s\n" % test.get_insert_query())
        with open("./sql/case.sql", "w") as f:
            for case in self.__cases:
                f.write("%s\n" % case.get_insert_query())
        with open("./sql/health_status.sql", "w") as f:
            for health_status in self.__health_statuses:
                f.write("%s\n" % health_status.get_insert_query())

    def __generate_notifications_for_today(self, today: datetime, tests: List[Test]):
        mandatory_notifications = []
        optional_notifications = []
        for test in tests:
            if test.get_result() == TEST_RESULT_POSITIVE:
                _mandatory_notifications, _optional_notifications = self.__generate_notifications_for_test(today, test)
                mandatory_notifications.extend(_mandatory_notifications)
                optional_notifications.extend(_optional_notifications)
        return mandatory_notifications, optional_notifications

    def __generate_notifications_for_test(self, today: datetime, test: Test) -> Tuple[List[Notification], List[Notification]]:
        sick_employee = [employee for employee in self.__employees if employee.get_id() == test.get_employee_id()][0]
        sick_employee_id = test.get_employee_id()

        # Meetings attended by the employee in the past 3 days
        all_impacted_meeting_ids = {employee_meeting.get_meeting_id() for employee_meeting in self.__employee_meetings if employee_meeting.get_employee_id() == sick_employee_id}

        # Mandatory notifications
        impacted_meetings_ids = {meeting.get_id() for meeting in self.__meetings if
                                 meeting.get_id() in all_impacted_meeting_ids and meeting.get_start_time() >= (test.get_tested_at() - timedelta(days=self.__config.notification_look_back_days))}
        mandatory_notified_employee_ids = {employee_meeting.get_employee_id() for employee_meeting in self.__employee_meetings if
                                           employee_meeting.get_meeting_id() in impacted_meetings_ids and employee_meeting.get_employee_id() != sick_employee_id}
        mandatory_notifications = [Notification(employee_id, test.get_id(), test.get_tested_at() + timedelta(days=1), "MANDATORY") for employee_id in mandatory_notified_employee_ids if
                                   employee_id != sick_employee_id]

        # Optional notifications
        impacted_floor_number = sick_employee.get_floor_number()
        optional_notified_employee_ids = {employee.get_id() for employee in self.__employees if employee.get_floor_number() == impacted_floor_number}
        optional_notifications = [Notification(employee_id, test.get_id(), today + timedelta(hours=self.__config.notification_time_delay_hours), "OPTIONAL") for employee_id in
                                  optional_notified_employee_ids if employee_id != sick_employee_id]

        return mandatory_notifications, optional_notifications

    def __generate_scans_for_today(self, today: datetime, healthy_employee_ids: Set[int]) -> List[Scan]:
        scans = []
        for employee_id in healthy_employee_ids:
            scanned_at = today + timedelta(hours=self.__config.scan_delay_hours, minutes=randint(0, 59))
            temperature = self.__sample_temperature()
            scans.append(Scan(scanned_at, employee_id, temperature))
        return scans

    def __generate_symptoms_for_today(self, today: datetime, healthy_employee_ids: Set[str]) -> List[Symptom]:
        symptoms = []
        symptomatic_employee_ids = sample(healthy_employee_ids, k=self.__config.max_symptomatic_employees_per_day)
        for employee_id in symptomatic_employee_ids:
            symptom = randint(1, self.__config.max_symptoms)
            reported_at = today + timedelta(hours=randint(19, 23))
            symptoms.append(Symptom(employee_id, reported_at, symptom))
        return symptoms

    def __generate_meetings_for_today(self, today: datetime, healthy_employee_ids: Set[str]) -> Tuple[List[Meeting], List[EmployeeMeeting]]:
        free_meeting_room_ids = [j for j in range(0, self.__config.max_meeting_rooms)]
        free_meeting_room_intervals = {j: [(8, 18)] for j in range(0, self.__config.max_meeting_rooms)}
        free_employee_intervals = {(j, j + 1): [employee_id for employee_id in healthy_employee_ids] for j in range(8, 18)}
        meetings = []
        assignments = []
        for i in range(0, self.__config.max_meetings_per_day):
            meeting = self.__meeting(today, free_meeting_room_ids, free_meeting_room_intervals)
            meetings.append(meeting)
            assignments.extend(self.__assign_employees_to_meetings(meeting, free_employee_intervals))
        return meetings, assignments

    def __meeting(self, today: datetime, free_meeting_room_ids: list, free_meeting_room_intervals: dict) -> Meeting:
        meeting_room_id, interval = self.__pick_meeting_room_and_time(free_meeting_room_ids, free_meeting_room_intervals)
        start = today + timedelta(hours=interval[0])
        end = today + timedelta(hours=interval[1])
        return Meeting(meeting_room_id, start, end, interval[0], interval[1])

    def __assign_employees_to_meetings(self, meeting: Meeting, free_employee_intervals: dict) -> List[EmployeeMeeting]:
        start, end = meeting.get_hour_interval()
        free_employees = free_employee_intervals[(start, end)]
        if len(free_employees) < 3:
            raise Exception("Unable to assign meeting. At least 3 free employees required in this interval")
        selected_employees = sample(free_employees, k=self.__config.employees_per_meeting)
        for selected_employee in selected_employees:
            free_employees.remove(selected_employee)
        return [EmployeeMeeting(employee_id, meeting.get_id()) for employee_id in selected_employees]

    def __generate_tests_for_today(self, today: datetime, notifications: List[Notification], scans: List[Scan], symptoms: List[Symptom]):
        tests = []
        candidate_employees = {employee.get_id(): dict() for employee in self.__employees}
        for notification in notifications:
            candidate_employees.get(notification.get_employee_id())[("%s" % KEY_NOTIFICATION_ID)] = notification.get_id()
        for scan in scans:
            candidate_employees.get(scan.get_employee_id())[("%s" % KEY_SCAN_ID)] = scan.get_id()
        for symptom in symptoms:
            candidate_employees.get(symptom.get_employee_id())[("%s" % KEY_SYMPTOM_ID)] = symptom.get_employee_id()
        for employee_id in candidate_employees.keys():
            if len(candidate_employees.get(employee_id)) > 0:
                location = sample(self.__config.locations, k=1)[0]
                tested_at = today + timedelta(hours=self.__config.test_delay_hours)
                notification_id = candidate_employees.get(employee_id).get(KEY_NOTIFICATION_ID, None)
                scan_id = candidate_employees.get(employee_id).get(KEY_SCAN_ID, None)
                symptom_id = candidate_employees.get(employee_id).get(KEY_SYMPTOM_ID, None)
                result = self.__sample_result()
                tests.append(Test(location, tested_at, employee_id, notification_id, scan_id, symptom_id, result))
        return tests

    def __generate_tests_for_sick_employees(self, today: datetime, sick_employee_ids: Set[int]):
        tests = []
        employee_cases: Dict[int, Case] = {case.get_employee_id(): case for case in self.__cases}
        for employee_id in sick_employee_ids:
            case = employee_cases.get(employee_id)
            if case.get_resolution() == STATUS_SICK and case.get_date() < today - timedelta(days=3):
                employee_id = case.get_employee_id()
                location = LOCATION_HOSPITAL
                tested_at = today + timedelta(hours=self.__config.test_delay_hours)
                result = TEST_RESULT_NEGATIVE
                tests.append(Test(location, tested_at, employee_id, -1, -1, -1, result))
        return tests

    def __update_cases_for_today(self, tests: List[Test]):
        employee_cases: Dict[int, Case] = {case.get_employee_id(): case for case in self.__cases}
        for test in tests:
            employee_id = test.get_employee_id()
            date = test.get_tested_at() + timedelta(hours=self.__config.case_test_delay_hours)
            if test.get_result() == TEST_RESULT_POSITIVE:
                if employee_id in employee_cases:
                    case = employee_cases.get(employee_id)
                    if case.get_resolution() != STATUS_SICK:
                        case.set_resolution(STATUS_SICK)
                        case.set_date(date)
                else:
                    case = Case(employee_id, date, STATUS_SICK)
                    self.__cases.append(case)
            else:
                if employee_id in employee_cases:
                    case = employee_cases.get(employee_id)
                    case.set_resolution(STATUS_BACK_TO_WORK)
                    case.set_date(date)

    def __generate_health_statuses_for_today(self, today: datetime) -> List[HealthStatus]:
        health_statuses = []
        for case in self.__cases:
            case_id = case.get_id()
            employee_id = case.get_employee_id()
            date = today + timedelta(hours=self.__config.health_status_delay_hours)
            if case.get_resolution() == STATUS_SICK:
                health_statuses.append(HealthStatus(case_id, employee_id, date, STATUS_SICK))
            elif case.get_resolution() == STATUS_BACK_TO_WORK:
                health_statuses.append(HealthStatus(case_id, employee_id, date, STATUS_WELL))
        return health_statuses

    def __generate_employees(self) -> list:
        employees = []
        for idx in range(self.__config.max_employees):
            employees.append(self.__employee(idx))
        return employees

    def __generate_meeting_rooms(self):
        meeting_rooms = []
        for idx in range(self.__config.max_meeting_rooms):
            meeting_rooms.append(self.__meeting_room(idx))
        return meeting_rooms

    @staticmethod
    def __sample_result():
        i = randint(1, 7)
        if i == 7:
            return TEST_RESULT_POSITIVE
        return TEST_RESULT_NEGATIVE

    @staticmethod
    def __sample_temperature():
        i = randint(1, 7)
        temperature = 98.6
        if i == 7:
            temperature += uniform(0.5, 4.0)
        return temperature

    def __employee(self, _id) -> Employee:
        name = self.__generate_name()
        office_number = randint(1, self.__config.max_rooms)
        floor_number = randint(1, self.__config.max_floors)
        phone_number = self.__generate_number()
        email_id = self.__generate_email(name)
        return Employee(_id, name, office_number, floor_number, phone_number, email_id)

    def __meeting_room(self, _id):
        floor_number = randint(1, self.__config.max_floors)
        return MeetingRoom(_id, floor_number)

    def __generate_name(self) -> str:
        i = randint(0, len(self.__config.first_names) - 1)
        first_name = self.__config.first_names[i]
        j = randint(0, len(self.__config.last_names) - 1)
        last_name = self.__config.last_names[j]
        return "%s %s" % (first_name, last_name)

    @staticmethod
    def __generate_number() -> str:
        code = str(randint(1, 9))
        for i in range(0, 2):
            code += str(randint(0, 9))
        first = str(randint(1, 9))
        for i in range(0, 2):
            first += str(randint(0, 9))
        second = str(randint(1, 9))
        for i in range(0, 3):
            second += str(randint(0, 9))
        return "(%s) %s-%s" % (code, first, second)

    @staticmethod
    def __generate_email(name: str) -> str:
        tokens = name.split(' ')
        suffix = randint(0, 999)
        return "%s.%s%s@company.com" % (tokens[0], tokens[1], suffix)

    def __pick_meeting_room_and_time(self, free_meeting_room_ids: list, free_meeting_room_intervals: dict):
        if len(free_meeting_room_ids) == 0:
            raise Exception("No more free meeting rooms left!")
        meeting_room_id = self.__get_free_meeting_room_id(free_meeting_room_ids)
        free_intervals = free_meeting_room_intervals[meeting_room_id]
        selected_interval = self.__select_interval(free_intervals)
        assert len(selected_interval) > 0
        free_intervals.remove(selected_interval)
        picked, remaining = self.__split_interval(selected_interval)
        free_intervals.extend(remaining)
        if len(free_intervals) == 0:
            free_meeting_room_intervals.pop(meeting_room_id)
            free_meeting_room_ids.remove(meeting_room_id)
        return meeting_room_id, picked

    @staticmethod
    def __get_free_meeting_room_id(free_meeting_room_ids: list) -> int:
        index = randint(0, len(free_meeting_room_ids) - 1)
        meeting_room_id = free_meeting_room_ids[index]
        return meeting_room_id

    @staticmethod
    def __select_interval(free_meeting_room_intervals: list) -> tuple:
        index = randint(0, len(free_meeting_room_intervals) - 1)
        return free_meeting_room_intervals[index]

    @staticmethod
    def __split_interval(interval: tuple) -> tuple:
        s = interval[0]
        e = interval[1]
        s_prime = randint(s, e - 1)
        e_prime = s_prime + 1
        left = (s, s_prime)
        picked = (s_prime, e_prime)
        right = (e_prime, e)
        return picked, [interval for interval in [left, right] if interval[0] < interval[1]]
