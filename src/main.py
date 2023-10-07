import datetime

from src.config import Config
from src.entity import Notification, Employee
from src.generator import Generator


def main():
    config = Config("./config/config.json")
    generator = Generator(config)
    generator.static_tasks()
    generator.dynamic_tasks()
    generator.dump()


if __name__ == '__main__':
    main()
    #
    # d1 = datetime.datetime(year=2023, month=9, day=30)
    # d2 = datetime.datetime(year=2023, month=9, day=26)
    #
    # print(d2 >= (d1 - datetime.timedelta(days=5)))