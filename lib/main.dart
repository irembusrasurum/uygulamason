import 'package:uygulama/models/student.dart';
import 'package:flutter/material.dart';
import 'package:uygulama/screens/student_add.dart';
import 'package:uygulama/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

// bir class sadece bi tane başka bi classtan extends edilebilir
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0,"", "", 0);

  List<Student> students = [
    new Student.withId(1,"İrem", "Sürüm", 20),
    Student.withId(2,"Ecrin", "Sürüm", 45),
    Student.withId(3,"Hamza", "Sürüm", 75)
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildBody(context));
  }



  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2020/02/05/19/14/lion-4822075_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      }); // seciliöğrenciyi kim kullanıyorsa sayfayı tekrar yenile

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili öğrenci : " + selectedStudent.firstName),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>StudentAdd(students)));
                      },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 2.0),
                      Text("Yeni Öğrenci", style: TextStyle(fontSize: 10.0)),
                    ],
                  )),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,// flexi büyütürsek kapladığı yer artar
              child:  ElevatedButton(

                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>StudentEdit(selectedStudent)));

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.update),
                      SizedBox(width: 2.0),
                      Text("Güncelle", style: TextStyle(fontSize: 10.0)),
                    ],
                  )),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:  ElevatedButton(
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });

                    var mesaj = "Silindi" ;
                    mesajGoster(context, mesaj);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 2.0),
                      Text("Sil", style: TextStyle(fontSize: 10.0)),
                    ],
                  )),
            )


          ],
        )
      ],
    );
  }
}

Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.done);
  } else if (grade >= 40) {
    return Icon(Icons.album);
  } else {
    return Icon(Icons.clear);
  }
}
