from datetime import datetime

from inflection import underscore


class MySQLInsertable:
    __COLUMN_TEMPLATE = "`%s`"
    __VALUE_TEMPLATE = "'%s'"

    def get_insert_query(self) -> str:
        table_name = underscore(self.__get_class_name())
        columns, values = self.__get_column_values()
        query = ("INSERT INTO `%s` %s "
                 "VALUES %s;") % (table_name, columns, values)
        return query

    def __get_class_name(self):
        return self.__class__.__name__

    def __get_column_values(self) -> tuple:
        columns = []
        values = []
        for key in self.__dict__.keys():
            value = self.__dict__.get(key)
            if value is not None:
                column = key.split(self.__get_class_name())[1][2:]
                columns.append(column)
                values.append(value)
        assert len(columns) == len(values)
        return (self.__get_list_template(len(columns), True) % tuple(columns),
                self.__get_list_template(len(values), False) % tuple(values))

    def __get_list_template(self, length: int, is_column: bool):
        template = "("
        token = self.__COLUMN_TEMPLATE if is_column else self.__VALUE_TEMPLATE
        for i in range(length - 1):
            template += "%s, " % token
        template += "%s)" % token
        return template


class Employee(MySQLInsertable):
    __ID = 0

    def __init__(self, _id: int, name: str, office_number: int, floor_number: int, phone_number: str,
                 email_id: str):
        self.__id = Employee.__ID
        self.__name = name
        self.__phone_number = phone_number
        self.__email_id = email_id
        self.__office_number = office_number
        self.__floor_number = floor_number
        Employee.__ID += 1

    def get_id(self):
        return self.__id

    def get_floor_number(self):
        return self.__floor_number


class MeetingRoom(MySQLInsertable):
    def __init__(self, _id, floor_number):
        self.__id = _id
        self.__floor_number = floor_number


class Meeting(MySQLInsertable):
    __ID = 0

    def __init__(self, meeting_room_id: int, start_time: datetime, end_time: datetime, start_hour: int, end_hour: int):
        self.__id = Meeting.__ID
        self.__meeting_room_id = meeting_room_id
        self.__start_time = start_time
        self.__end_time = end_time
        self.__start_hour = start_hour
        self.__end_hour = end_hour
        Meeting.__ID += 1

    def get_id(self):
        return self.__id

    def get_start_time(self):
        return self.__start_time

    def get_hour_interval(self):
        return self.__start_hour, self.__end_hour


class EmployeeMeeting(MySQLInsertable):
    def __init__(self, employee_id: int, meeting_id: int):
        self.__employee_id = employee_id
        self.__meeting_id = meeting_id

    def get_employee_id(self):
        return self.__employee_id

    def get_meeting_id(self):
        return self.__meeting_id


class Symptom(MySQLInsertable):
    __ID = 0

    def __init__(self, employee_id: str, reported_at: datetime, symptom_id: int):
        self.__id = Symptom.__ID
        self.__employee_id = employee_id
        self.__reported_at = reported_at
        self.__symptom_id = symptom_id
        Symptom.__ID += 1

    def get_employee_id(self):
        return self.__employee_id

    def get_reported_at(self):
        return self.__reported_at


class Scan(MySQLInsertable):
    __ID = 0

    def __init__(self, scanned_at: datetime, employee_id: int, temperature: float):
        self.__id = Scan.__ID
        self.__scanned_at = scanned_at
        self.__employee_id = employee_id
        self.__temperature = temperature
        Scan.__ID += 1

    def get_id(self):
        return self.__id

    def get_employee_id(self):
        return self.__employee_id

    def get_scanned_at(self):
        return self.__scanned_at


class Test(MySQLInsertable):
    __ID = 0

    def __init__(self, location: str, tested_at: datetime, employee_id: int, notification_id: int, scan_id: int, symptom_id: int, result: str):
        self.__id = Test.__ID
        self.__location = location
        self.__tested_at = tested_at
        self.__employee_id = employee_id
        # self.__notification_id = notification_id
        # self.__scan_id = scan_id
        # self.__symptom_id = symptom_id
        self.__result = result
        Test.__ID += 1

    def get_id(self):
        return self.__id

    def get_employee_id(self):
        return self.__employee_id

    def get_tested_at(self):
        return self.__tested_at

    def get_result(self):
        return self.__result


class EmployeeCase(MySQLInsertable):
    __ID = 0

    def __init__(self, employee_id: int, date: datetime, resolution: str):
        self.__id = EmployeeCase.__ID
        self.__employee_id = employee_id
        self.__date = date
        self.__resolution = resolution
        EmployeeCase.__ID += 1

    def get_id(self):
        return self.__id

    def get_employee_id(self):
        return self.__employee_id

    def get_resolution(self):
        return self.__resolution

    def get_date(self):
        return self.__date

    def set_resolution(self, resolution: str):
        self.__resolution = resolution
        return self.__resolution

    def set_date(self, date: datetime):
        self.__date = date
        return self.__date


class HealthStatus(MySQLInsertable):
    __ID = 0

    def __init__(self, case_id: int, employee_id: int, date: datetime, status: str):
        self.__id = HealthStatus.__ID
        self.__case_id = case_id
        self.__employee_id = employee_id
        self.__date = date
        self.__status = status
        HealthStatus.__ID += 1


class Notification(MySQLInsertable):
    __ID = 0

    def __init__(self, employee_id: int, test_id: int, sent_at: datetime, type: str):
        self.__id = Notification.__ID
        self.__employee_id = employee_id
        self.__test_id = test_id
        self.__sent_at = sent_at
        self.__type = type
        Notification.__ID += 1

    def get_id(self):
        return self.__id

    def get_employee_id(self):
        return self.__employee_id
