import 'dart:convert';

import 'package:express_flutter_client/ReadView.dart';
import 'package:express_flutter_client/Student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
class Modify extends StatefulWidget {
  // const Modify({super.key});
  String id="";
  Modify(this.id);

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  var studentDeptController=TextEditingController();
  var studentNameController=TextEditingController();
  var studentIDController=TextEditingController();
  var studentSkillController=TextEditingController();
  var studentCgpaController=TextEditingController();
  var studentInterestController=TextEditingController();
  var studentPlacedController=TextEditingController();

  readOneFromExpress()async{
    // print(widget.id);
    var url=Uri.parse("http://localhost:2020/find/${widget.id}");
    var response = await http.get(url);
    if(response.statusCode==200){
      var record = jsonDecode(response.body);
      return record['message'];
    }
  }

  changeInExpress()async{
    var url=Uri.parse("http://localhost:2020/up");
    Map<String,String> myHeader={"content-type":"application/json"};
    Map<String,dynamic> myStudent={
      "student_id":studentIDController.text,
      "student_name":studentNameController.text,
      "student_dept":studentDeptController.text,
      "student_skill":studentSkillController.text,
      "student_cgpa":double.parse(studentCgpaController.text),
      "student_interest":studentInterestController.text,
      "student_placed":studentPlacedController.text
    };
    var response = await http.put(url,headers: myHeader,body: jsonEncode(myStudent));
    if(response.statusCode==200){
      var bdy=jsonDecode(response.body);
      // print(bdy['message']);
      Toast.show(bdy['message'],duration: Toast.lengthLong);
    }
    studentIDController.text="";studentNameController.text="";
    studentCgpaController.text="";studentSkillController.text="";
    studentDeptController.text="";studentInterestController.text="";
    studentPlacedController.text="";
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update the Student Record ${widget.id}'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.indigo,
      ),
      body:FutureBuilder(
        future: readOneFromExpress(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: Text('Invalid Student Id'),
            );
          }
          else{
            var temp = snapshot.data as Map<String,dynamic>;
            studentIDController.text=temp['student_id'];
            studentNameController.text=temp['student_name'];
            studentCgpaController.text=temp['student_cgpa'].toString();
            studentSkillController.text=temp['student_skill'];
            studentDeptController.text=temp['student_dept'];
            studentInterestController.text=temp['student_interest'];
            studentPlacedController.text=temp['student_placed'];
            return Container(
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
                            readOnly: true,
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
                            readOnly: true,
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
                          TextField(
                            readOnly: true,
                            controller: studentDeptController,
                            style: TextStyle(color: Colors.indigo),
                            decoration: InputDecoration(
                              hintText: "Student Department",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                            ),
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
                          TextField(
                            controller: studentInterestController,
                            style: TextStyle(color: Colors.indigo),
                            decoration: InputDecoration(
                              hintText: "Student Interest",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: studentPlacedController,
                            style: TextStyle(color: Colors.indigo),
                            decoration: InputDecoration(
                              hintText: "Student Placed",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                            ),
                          ),
                          SizedBox(height: 2.0,),
                          OutlinedButton.icon(
                              onPressed: (){
                                changeInExpress();
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => ReadView()
                                  ,));
                              },
                              icon: Icon(Icons.upload),
                              label: Text('Update',style: TextStyle(
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
            );
          }
        },
      )
    );
  }
}
