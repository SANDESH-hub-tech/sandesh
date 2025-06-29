# Dictionary to store student details
students = {}

# List to store available courses
courses = []

def add_student(name, roll_number, department):
    students[roll_number] = {
        "name": name,
        "department": department,
        "courses": {}
    }

def add_course(course_code, course_name, credits):
    courses.append({"code": course_code, "name": course_name, "credits": credits})

def enroll_student(roll_number, course_code):
    if roll_number in students and any(course["code"] == course_code for course in courses):
        students[roll_number]["courses"][course_code] = {"grade": None}
    else:
        print("Invalid student roll number or course code.")

def assign_grade(roll_number, course_code, grade):
    if roll_number in students and course_code in students[roll_number]["courses"]:
        students[roll_number]["courses"][course_code]["grade"] = grade
    else:
        print("Invalid student roll number or course code.")

def display_student_record(roll_number):
    if roll_number in students:
        student = students[roll_number]
        print(f"Name: {student['name']}, Department: {student['department']}")
        print("Enrolled Courses:")
        for course_code, details in student["courses"].items():
            grade = details["grade"] if details["grade"] else "Not Assigned"
            print(f"- {course_code}: Grade {grade}")
    else:
        print("Student record not found.")

def list_students():
    print("List of students:")
    for roll_number, student in students.items():
        print(f"{roll_number}: {student['name']} - {student['department']}")

def list_courses():
    print("Available courses:")
    for course in courses:
        print(f"{course['code']}: {course['name']} ({course['credits']} credits)")

# Example Usage:
add_student("Alice", "1001", "CSE")
add_student("Bob", "1002", "ECE")

add_course("CS101", "Intro to CS", 3)
add_course("MA101", "Calculus I", 4)

enroll_student("1001", "CS101")
enroll_student("1001", "MA101")
enroll_student("1002", "CS101")

assign_grade("1001", "CS101", "A")
assign_grade("1001", "MA101", "B+")
assign_grade("1002", "CS101", "B")

display_student_record("1001")
list_students()
list_courses()