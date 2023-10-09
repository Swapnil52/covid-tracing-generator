CSCI 585 Homework 2
Swapnil Dhanwal
USC ID: 3557859266

Submission Notes:
- Please use online MySQL compiler (https://www.mycompiler.io/new/mysql)
- If using https://www.mycompiler.io/new/mysql, please paste and run all queries from Q1.sql to Q5.sql in the same editor/session

Assumptions:
- There are 25 employees in the company
- There are 10 floors in the building and 10 meeting rooms. Employees sit in office rooms which are different from meeting rooms
- There are 5 symptoms, numbered 1 to 5 for self reports in the symptom table
- Employees can report one symptom at a time and must get tested if they do
- On daily scans, temperatures above 100 F are considered feverish and are sent for mandatory onsite tests
- Notifications can be of type MANDATORY or OPTIONAL. Employees who get a mandatory notification must get tested
- Tests are mandatorily conducted for employees who self report a symptom, have a fever or receive a mandatory notification
- Employees need only submit one test per day if they received one or more mandatory notification or reported one or more symptoms that day
- Employees who get a negative test after more than a week of being sick are allowed back to the office

