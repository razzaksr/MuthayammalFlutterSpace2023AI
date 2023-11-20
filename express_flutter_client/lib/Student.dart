class Student{
  String student_id;
  String student_name;
  String student_dept;
  String student_skill;
  String student_interest;
  String student_placed;
  double student_cgpa;
  Student(this.student_id,this.student_name,this.student_dept,this.student_cgpa,this.student_skill,this.student_interest,this.student_placed);
  @override
  String toString() {
    // TODO: implement toString
    return "Student name is $student_name with ID of $student_id from department of $student_dept with CGPA $student_cgpa having interest on $student_interest along with skill $student_skill placement status $student_placed";
  }
}