import json

from random import randint
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
        return str(type(self)).split("'__main__.")[1][:-2]

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


class Generator:
    def __init__(self, first_names: list, last_names: list, max_rooms: int, max_floors: int):
        self.__first_names = first_names
        self.__last_names = last_names
        self.__max_rooms = max_rooms
        self.__max_floors = max_floors

    def employee(self, _id) -> Employee:
        name = self.__generate_name()
        office_number = randint(1, self.__max_rooms)
        floor_number = randint(1, self.__max_floors)
        phone_number = self.__generate_number()
        email_id = self.__generate_email(name)
        return Employee(_id, name, office_number, floor_number, phone_number, email_id)

    def meeting_room(self, _id):
        floor_number = randint(1, self.__max_floors)
        return MeetingRoom(_id, floor_number)

    def __generate_name(self) -> str:
        i = randint(0, len(self.__first_names) - 1)
        first_name = self.__first_names[i]
        j = randint(0, len(self.__last_names) - 1)
        last_name = self.__last_names[j]
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


class Company:
    def __init__(self, generator: Generator, max_employees: int, max_meeting_rooms: int):
        self.__generator = generator
        self.__max_employees = max_employees
        self.max_meeting_rooms = max_meeting_rooms
        self.__employees = self.__generate_employees()
        self.__meeting_rooms = self.__generate_meeting_rooms()

    def dump(self):
        with open("../sql/employee.sql", "w") as f:
            for meeting_room in self.__employees:
                f.write("%s\n" % meeting_room.get_insert_query())
        with open("../sql/meeting_room.sql", "w") as f:
            for meeting_room in self.__meeting_rooms:
                f.write("%s\n" % meeting_room.get_insert_query())

    def __generate_employees(self) -> list:
        employees = []
        for idx in range(self.__max_employees):
            employees.append(self.__generator.employee(idx))
        return employees

    def __generate_meeting_rooms(self):
        meeting_rooms = []
        for idx in range(self.__max_employees):
            meeting_rooms.append(self.__generator.meeting_room(idx))
        return meeting_rooms

    @property
    def employees(self):
        return self.__employees


def main():
    with open("../data/names.json", "r") as f:
        names = json.load(f)
    generator = Generator(names["first_names"], names["last_names"], 10, 10)
    company = Company(generator, 100, 20)
    company.dump()


if __name__ == '__main__':
    main()
    pass
