class Student{

  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;

  Student.withId(int id,String firstName, String lastName, int grade){
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student(String firstName, String lastName, int grade){
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }


  Student.withoutInfo(){

  }

  String get getFirstName{
    return "OGR -" + this.firstName;
  }

  void set setFirstName (String value){
    this.firstName = value;

  }
  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message ="Geçti";
    }
    else if (this.grade >= 40) {
      message = "Bütünleme";
    }
    else {
      message = "Kaldı";
    }
    return message;
  }
}