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
    def __init__(self, _id: str, name: str, office_number: int, floor_number: int, phone_number: str,
                 email_id: str):
        self.__id = _id
        self.__name = name
        self.__phone_number = phone_number
        self.__email_id = email_id
        self.__office_number = office_number
        self.__floor_number = floor_number


class MeetingRoom(MySQLInsertable):
    def __init__(self, _id, floor_number):
        self.__id = _id
        self.__floor_number = floor_number


class Meeting(MySQLInsertable):
    def __init__(self, _id, meeting_room_id: int, start_time: str, end_time: str, start_hour: int, end_hour: int):
        self.__id = _id
        self.__meeting_room_id = meeting_room_id
        self.__start_time = start_time
        self.__end_time = end_time
        self.__start_hour = start_hour
        self.__end_hour = end_hour

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