# covid-tracing-generator
Configurable covid tracing data generator for CSCI 585 HW2, which simulates the following:
- Random generation of employees
- Random generation of meeting rooms
- For each day from the start day till last day:
  - We maintain a set of sick and healthy employees 
  - Sick employees do not attend office 
  - Healthy employees attend meetings (Meetings are randomly generated, with a configurable number of employees per meeting. An employees schedule is free of conflicts)
  - Healthy employees self-report symptoms (1), with a configurable probability
  - Healthy employees get temperature scanned at the office (2), with a configurable probability
  - Healthy employees receive contact tracing notifications (3), with a configurable probability
  - Employees (1), (2) and (3) submit covid tests
  - Some employees test positive (with a configurable probability) leading to contact tracing notifications for employees they attended meetings with + non-mandatory notifications
  - Cases and health statuses are updated for existing and newly sick employees:
    - After a certain number of days, an employee can reach a terminal status (back to work, resignation or deceased). (probability is configurable)

Also supports object oriented query generation by a class extending `MySQLInsertable`. All private fields (starting with '__') are included in the insert query

An example configuration is given below:
```
{
  "first_names": [
    "sarthak",
    "vaibhav",
    "vaibhav",
    "tanya",
    "sweta",
    "ritesh",
    "kriti",
    "subham",
    "kartik",
    "rohan",
    "akshat",
    "vedant"
  ],
  "last_names": [
    "agarwal",
    "saini",
    "singal",
    "agarwal",
    "singh",
    "reddy",
    "jha",
    "kumar",
    "kalia",
    "samtani",
    "jain",
    "bharat"
  ],
  "max_employees": 25,
  "max_meeting_rooms": 10,
  "max_meetings": 50,
  "max_meetings_per_day": 3,
  "employees_per_meeting": 3,
  "max_rooms": 10,
  "max_floors": 10,
  "start_day": "2023-09-01",
  "num_days": 10,
  "max_symptomatic_employees_per_day": 1,
  "max_symptoms": 5,
  "symptoms": [
    "cough",
    "cold",
    "fever",
    "body ache",
    "loss of taste/smell"
  ],
  "locations": [
    "hospital",
    "onsite",
    "clinic"
  ],
  "symptom_test_delay": 6,
  "scan_fever_threshold": 100.0,
  "sickness_probability_den": 5,
  "scan_test_delay": 1,
  "scan_delay_hours": 7,
  "test_delay_hours": 6,
  "sick_employee_retest_delay_days": 7,
  "test_results": [
    "POSITIVE",
    "NEGATIVE"
  ],
  "initial_resolutions": [
    "sick"
  ],
  "terminal_resolutions": [
    "back to work",
    "left company",
    "deceased"
  ],
  "case_test_delay_hours": 2,
  "notification_look_back_days": 3,
  "notification_test_delay_days": 1,
  "health_status_delay_hours": 19,
  "resignation_chance_one_in": 7,
  "decease_chance_one_in": 8,
  "expel_delay_days": 5
}
```

To run, import the project in PyCharm and run `src/main.py`
