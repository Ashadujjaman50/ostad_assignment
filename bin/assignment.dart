abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role? role;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print('Role: Person');
  }

  //getter
  String get getName {
    return name;
  }

  int get getAge {
    return age;
  }

  String get getAddress {
    return address;
  }
}

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(name, age, address, this.studentID, this.grade, this.courseScores)
    : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverage() {
    if (courseScores.isEmpty) {
      return 0;
    } else {
      double total = courseScores.reduce((a, b) => a + b);
      return total / courseScores.length;
    }
  }

  void studentInfo() {
    print('\nStudent Information:\n');
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average Score: ${calculateAverage().toStringAsFixed(1)}');
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(name, age, address, this.teacherID, this.coursesTaught)
    : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void teacherInfo() {
    print('\nTeacher Information:\n');
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Courses Taught:');
    for (String course in coursesTaught) {
      print('- $course');
    }
  }
}

class StudentManagementSystem {
  static void done() {
    Student student = Student('John Doe', 20, '123 Main St', 'S001', 'A', [
      90,
      85,
      82,
    ]);

    Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 'T001', [
      "Math",
      "English",
      "Bangla",
    ]);

    student.studentInfo();
    teacher.teacherInfo();
  }
}

void main() {
  StudentManagementSystem.done();
}
