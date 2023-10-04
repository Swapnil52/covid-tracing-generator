from datetime import timedelta, datetime
from random import randint, sample, uniform
from typing import List

from src.config import Config
from src.entity import Employee, MeetingRoom, Meeting, EmployeeMeeting, Symptom, Scan


class Generator:
    def __init__(self, config: Config):
        self.__config = config
        self.__employees = []
        self.__meeting_rooms = []
        self.__meetings = []
        self.__employee_meetings = []
        self.__symptoms = []
        self.__symptomatic_employees = []
        self.__scans = []
        self.__employee_symptoms = []
        self.__free_meeting_room_intervals = {
            config.start_day + timedelta(days=i): {
                j: [(8, 18)]
                for j in range(0, config.max_meeting_rooms)
            }
            for i in range(0, config.num_days)
        }
        self.__free_meeting_room_ids = {
            config.start_day + timedelta(days=i): [j for j in range(0, config.max_meeting_rooms)]
            for i in range(0, config.num_days)
        }
        self.__free_employee_intervals = {
            config.start_day + timedelta(days=i): {
                (j, j + 1): [k for k in range(0, config.max_employees)]
                for j in range(8, 18)
            }
            for i in range(0, config.num_days)
        }

    def generate(self):
        self.__employees = self.__generate_employees()
        self.__meeting_rooms = self.__generate_meeting_rooms()
        self.__meetings, self.__employee_meetings = self.__generate_meetings()
        self.__symptoms = self.__generate_symptoms()
        self.__scans = self.__generate_scans()
        self.__symptoms = self.__generate_symptoms()

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

    def __generate_meetings(self):
        start_day = self.__config.start_day
        num_days = self.__config.num_days
        meetings = []
        assignments = []
        start_id = 0
        for i in range(0, num_days):
            day = start_day + timedelta(days=i)
            day_meetings = self.__generate_meetings_for_day(start_id, day)
            for meeting in day_meetings:
                assignments.extend(self.__assign_employees(meeting, day))
            meetings.extend(day_meetings)
            start_id += len(day_meetings)
        return meetings, assignments

    def __generate_meetings_for_day(self, start_id: int, day: datetime) -> List[Meeting]:
        meetings = []
        for idx in range(self.__config.max_meetings_per_day):
            meetings.append(self.__meeting(start_id + idx, day))
        return meetings

    def __assign_employees(self, meeting: Meeting, day: datetime) -> List[EmployeeMeeting]:
        free_employee_intervals_day = self.__free_employee_intervals[day]
        start, end = meeting.get_hour_interval()
        free_employees = free_employee_intervals_day[(start, end)]
        if len(free_employees) < 3:
            raise Exception("Unable to assign meeting. At least 3 free employees required in this interval")
        selected_employees = sample(free_employees, k=3)
        for selected_employee in selected_employees:
            free_employees.remove(selected_employee)
        return [EmployeeMeeting(employee_id, meeting.get_id()) for employee_id in selected_employees]

    def __generate_symptoms(self) -> List[Symptom]:
        symptoms = []
        symptom_id = 0
        for delta in range(self.__config.num_days):
            symptomatic_employees = sample(self.__employees, k=self.__config.max_symptomatic_employees_per_day)
            for employee in symptomatic_employees:
                symptom = randint(1, self.__config.max_symptoms)
                reported_at = self.__config.start_day + timedelta(days=delta, hours=randint(19, 23))
                symptoms.append(Symptom(symptom_id, employee.get_id(), reported_at, symptom))
        return symptoms

    def __generate_scans(self) -> List[Scan]:
        scans = []
        scan_id = 0
        for i in range(self.__config.num_days):
            for __employee in self.__employees:
                scanned_at = self.__config.start_day + timedelta(days=i, hours=7, minutes=randint(0, 59))
                temperature = self.__get_temperature()
                scans.append(Scan(scan_id, scanned_at, __employee.get_id(), temperature))
                scan_id += 1
        return scans

    @staticmethod
    def __get_temperature():
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

    def __meeting(self, _id: int, day: datetime) -> Meeting:
        meeting_room_id, interval = self.__pick_meeting_room_and_time(self.__free_meeting_room_ids[day],
                                                                      self.__free_meeting_room_intervals[day])
        start = str(day + timedelta(hours=interval[0]))
        end = str(day + timedelta(hours=interval[1]))
        return Meeting(_id, meeting_room_id, start, end, interval[0], interval[1])

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
