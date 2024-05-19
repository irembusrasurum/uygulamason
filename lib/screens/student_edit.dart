
import 'package:flutter/material.dart';
import 'package:uygulama/models/student.dart';
import 'package:uygulama/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
 final Student selectedStudent;
  StudentEdit(this.selectedStudent);
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

//biz bir şeyi değiştirdiğimizde hepsi değişsin istiyorsak statefulwidget yapmamız lazım
class _StudentEditState extends State<StudentEdit> with StudentValidationMixin {
  final Student selectedStudent;

  var formKey = GlobalKey<FormState>();


  _StudentEditState(this.selectedStudent);


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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "İrem"),
      validator: validateFirstName,
      onSaved: (value) {
        selectedStudent.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
          labelText: "Öğrenci soyadı", hintText: "Sürüm"),
      validator: validateLastName,
      onSaved: (value) {
        selectedStudent.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (value) {
        selectedStudent.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
          setState(() {
            saveStudent();
          });

          Navigator.pop(context,selectedStudent);

        }
      },
      child: Text("Kaydet"),
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }




}
