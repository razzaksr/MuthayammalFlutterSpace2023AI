import 'dart:convert';

import 'package:express_flutter_client/Student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home:Enroll()
  ));
}

class Enroll extends StatefulWidget {
  const Enroll({super.key});

  @override
  State<Enroll> createState() => _EnrollState();
}

class _EnrollState extends State<Enroll> {

  List<String> departments=['cse','it','ai&ds','cs','ai&ml','ece','eee'];
  String selectedDepartment='cse';
  var studentNameController=TextEditingController();
  var studentIDController=TextEditingController();
  var studentSkillController=TextEditingController();
  var studentCgpaController=TextEditingController();
  String selectedInterest='';

  sendToExpress()async{
    // Student current=Student(
    //     studentIDController.text,studentNameController.text,
    //     selectedDepartment,double.parse(studentCgpaController.text),
    //     studentSkillController.text,selectedInterest,"No"
    // );

    var url=Uri.parse("http://localhost:2020/");
    Map<String,String> myHeader={"content-type":"application/json"};
    Map<String,dynamic> myStudent={
      "student_id":studentIDController.text,
      "student_name":studentNameController.text,
      "student_dept":selectedDepartment,
      "student_skill":studentSkillController.text,
      "student_cgpa":double.parse(studentCgpaController.text),
      "student_interest":selectedInterest
    };
    var response = await http.post(url,headers: myHeader,body: jsonEncode(myStudent));
    if(response.statusCode==200){
      var bdy=jsonDecode(response.body);
      print(bdy['message']);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MEC Placement Enroll'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Card(
              margin: EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: studentIDController,
                      style: TextStyle(color: Colors.indigo),
                      decoration: InputDecoration(
                        hintText: "Student ID",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: studentNameController,
                      style: TextStyle(color: Colors.indigo),
                      decoration: InputDecoration(
                        hintText: "Student Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: studentCgpaController,
                      style: TextStyle(color: Colors.indigo),
                      decoration: InputDecoration(
                        hintText: "Student CGPA",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    DropdownButton(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(30.0),
                        value: selectedDepartment,
                        items: departments.map<DropdownMenuItem<String>>(
                                (String e) => DropdownMenuItem(
                                child: Text(e),
                                value:e,
                                )
                        ).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedDepartment=value;
                          });
                        },
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: studentSkillController,
                      style: TextStyle(color: Colors.indigo),
                      decoration: InputDecoration(
                        hintText: "Student Skill",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Select Interest',style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.indigo
                        ),),
                        SizedBox(width: 200.0,),
                        Radio(
                            value: 'it',
                            groupValue: selectedInterest,
                            onChanged: (value){
                              setState(() {
                                selectedInterest=value!;
                              });
                            }
                        ),
                        Text('IT'),SizedBox(width: 30.0,),
                        Radio(
                            value: 'core',
                            groupValue: selectedInterest,
                            onChanged: (value){
                              setState(() {
                                selectedInterest=value!;
                              });
                            }
                        ),
                        Text('CORE'),SizedBox(width: 30.0,),
                        Radio(
                            value: 'studies',
                            groupValue: selectedInterest,
                            onChanged: (value){
                              setState(() {
                                selectedInterest=value!;
                              });
                            }
                        ),
                        Text('Studies'),
                      ],
                    ),
                    OutlinedButton.icon(
                        onPressed: (){
                          sendToExpress();
                        },
                        icon: Icon(Icons.add_task),
                        label: Text('Enroll',style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.indigo
                        ),)
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
