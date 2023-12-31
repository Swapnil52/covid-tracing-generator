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
            self.employees_per_meeting = config["employees_per_meeting"]
            self.max_rooms = config["max_rooms"]
            self.max_floors = config["max_floors"]
            start_day_tokens = [int(token) for token in config["start_day"].split('-')]
            self.start_day = datetime(year=start_day_tokens[0], month=start_day_tokens[1], day=start_day_tokens[2])
            self.num_days = config["num_days"]
            self.max_symptomatic_employees_per_day = config["max_symptomatic_employees_per_day"]
            self.max_symptoms = config["max_symptoms"]
            self.symptoms = config["symptoms"]
            self.locations = config["locations"]
            self.symptom_test_delay = config["symptom_test_delay"]
            self.scan_fever_threshold = config["scan_fever_threshold"]
            self.scan_delay_hours = config["scan_delay_hours"]
            self.scan_test_delay = config["scan_test_delay"]
            self.sickness_probability_den = config["sickness_probability_den"]
            self.test_delay_hours = config["test_delay_hours"]
            self.sick_employee_retest_delay_days = config["sick_employee_retest_delay_days"]
            self.test_results = config["test_results"]
            self.case_test_delay_hours = config["case_test_delay_hours"]
            self.initial_resolutions = config["initial_resolutions"]
            self.terminal_resolutions = config["terminal_resolutions"]
            self.notification_look_back_days = config["notification_look_back_days"]
            self.notification_test_delay_days = config["notification_test_delay_days"]
            self.health_status_delay_hours = config["health_status_delay_hours"]
            self.resignation_chance_one_in = config["resignation_chance_one_in"]
            self.decease_chance_one_in = config["decease_chance_one_in"]
            self.expel_delay_days = config["expel_delay_days"]
