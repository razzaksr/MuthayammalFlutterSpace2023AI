import 'dart:convert';

import 'package:express_flutter_client/Student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
class ReadView extends StatefulWidget {
  const ReadView({super.key});

  @override
  State<ReadView> createState() => _ReadViewState();
}

class _ReadViewState extends State<ReadView> {
  List<Student> myStudents=[];

  readAllFromExpress()async{
    List<Student> temporary=[];
      var url=Uri.parse("http://localhost:2020/");
      var response = await http.get(url);
      if(response.statusCode==200){
        var records = jsonDecode(response.body);
        records['message'].forEach((object){
        Student stud=Student(
            object['student_id'],
            object['student_name'],
            object['student_dept'],
            object['student_cgpa'],
            object['student_skill'],
            object['student_interest'],
            object['student_placed']);
        temporary.add(stud);
        });
        //print(temporary.toString());
      }
      return temporary;
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('View Students'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.indigo,
      ),
      body:FutureBuilder(
        future: readAllFromExpress(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: Text('No data available'),
            );
          }
          else{
            myStudents=snapshot.data as List<Student>;
            return ListView.builder(
                itemCount: myStudents.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amberAccent,
                    margin: EdgeInsets.all(20.0),
                    child: ListTile(
                      textColor: Colors.indigo,
                      leading: CircleAvatar(
                        child: Text(myStudents[index].student_name[0]),
                        radius: 50.0,
                      ),
                      title: Text(
                        myStudents[index].student_name,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onTap: (){
                        Toast.show(myStudents[index].toString(),duration: Toast.lengthLong);
                      },
                    ),
                  );
                },
            );
          }
        },
      )
    );
  }
}
