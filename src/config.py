import json
from datetime import datetime


class Config:
    def __init__(self, file_path):
        with open(file_path, "r") as f:
            config = json.load(f)
            self.first_names = config["first_names"]
            self.last_names = config["last_names"]
            self.max_employees = config["max_employees"]
            self.max_meeting_rooms = config["max_meeting_rooms"]
            self.max_meetings = config["max_meetings"]
            self.max_meetings_per_day = config["max_meetings_per_day"]
            self.max_rooms = config["max_rooms"]
            self.max_floors = config["max_floors"]
            start_day_tokens = [int(token) for token in config["start_day"].split('-')]
            self.start_day = datetime(year=start_day_tokens[0], month=start_day_tokens[1], day=start_day_tokens[2])
            self.num_days = config["num_days"]
