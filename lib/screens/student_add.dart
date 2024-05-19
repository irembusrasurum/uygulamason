
import 'package:flutter/material.dart';
import 'package:uygulama/models/student.dart';
import 'package:uygulama/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List <Student> students = [];
  StudentAdd(students){
  this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

//biz bir şeyi değiştirdiğimizde hepsi değişsin istiyorsak statefulwidget yapmamız lazım
class _StudentAddState extends State with StudentValidationMixin {
  List <Student> students= [];
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();


  _StudentAddState(students){
    this.students = students;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni öğrenci ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "İrem"),
      validator: validateFirstName,
      onSaved: (value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci soyadı", hintText: "Sürüm"),
      validator: validateLastName,
      onSaved: (value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (value) {
        student.grade = int.parse(value!);
      },
    );
  }

 Widget buildSubmitButton() {
    return ElevatedButton(
        onPressed: (){
          if(formKey.currentState!.validate()){
          formKey.currentState?.save();
          students.add(student);
          setState(() {
            saveStudent();
          });
          Navigator.pop(context,student);

          }
        },
        child: Text("Kaydet"),
    );
 }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }




}
