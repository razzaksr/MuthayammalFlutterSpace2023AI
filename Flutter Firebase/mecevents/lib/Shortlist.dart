import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/EventDrawer.dart';
import 'package:toast/toast.dart';
class Shortlist extends StatefulWidget {
  const Shortlist({super.key});

  @override
  State<Shortlist> createState() => _ShortlistState();
}

class _ShortlistState extends State<Shortlist> {
  var departmentController=TextEditingController();
  var countController=TextEditingController();
  var dateController=TextEditingController();

  var myFiltered=[];
  bool showView=false;

  final firestoreObj=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC Filter'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amberAccent,
      ),
      drawer: EventDrawer(),
      body:Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            margin: EdgeInsets.all(12.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: departmentController,
                    decoration: InputDecoration(
                      hintText: "Filter by Department"
                    ),
                  ),
                  Text('OR'),
                  SizedBox(height: 5.0,),
                  TextField(
                    controller: countController,
                    decoration: InputDecoration(
                        hintText: "Filter by Participants"
                    ),
                  ),
                  Text('OR'),
                  SizedBox(height: 5.0,),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        hintText: "Filter by Date YYYY-MM-DD"
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  OutlinedButton.icon(
                      onPressed: ()async{
                        if(departmentController.text!=""&&
                        countController.text==""&&dateController.text==""){
                          // filter by department
                          QuerySnapshot qrySnap = await firestoreObj.collection("symposium").get();
                          var documents=qrySnap.docs;
                          myFiltered = documents.where(
                                  (each)=>each['event_id'].contains(departmentController.text))
                              .toList();
                          print(myFiltered.length);
                          setState(() {
                            showView=true;
                          });
                        }
                        else if(departmentController.text==""&&
                            countController.text!=""&&dateController.text==""){
                          // filter by participants count
                          QuerySnapshot qrySnap = await firestoreObj.collection("symposium").where(
                            "event_participnats_count",isGreaterThanOrEqualTo: num.parse(countController.text)
                          ).get();
                          var documents=qrySnap.docs;
                          documents.forEach((element) { myFiltered.add(element); });
                          setState(() {
                            showView=true;
                          });
                        }
                        else if(departmentController.text==""&&
                            countController.text==""&&dateController.text!=""){
                          // filter by date
                          QuerySnapshot qrySnap = await firestoreObj.collection("symposium").where(
                            "event_date",isEqualTo: DateTime.parse(dateController.text)
                          ).get();
                          var documents=qrySnap.docs;
                          documents.forEach((element) { myFiltered.add(element); });
                          setState(() {
                            showView=true;
                          });
                        }
                        else{
                          Toast.show("Invalid Filter",duration: Toast.lengthLong);
                        }
                      },
                      icon: Icon(Icons.filter_alt_outlined),
                      label: Text("Filter")
                  ),
                  SizedBox(height: 20.0,),
                  OutlinedButton.icon(
                      onPressed: (){
                        setState(() {
                          showView=false;
                          myFiltered=[];
                          departmentController.text="";
                          dateController.text="";
                          countController.text="";
                        });
                      },
                      icon: Icon(Icons.reset_tv_rounded),
                      label: Text("Reset")
                  ),
                  Visibility(
                    visible: showView,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: myFiltered.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.purple,
                          margin: EdgeInsets.all(12.0),
                          child: ListTile(
                            onTap: (){

                            },
                            textColor: Colors.amberAccent,
                            leading: CircleAvatar(
                              child: Text(myFiltered[index]['event_name'][0]),
                              radius: 20.0,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Event Name: ${myFiltered[index]['event_name']}"),
                                Text("Event Id: ${myFiltered[index]['event_id']}"),
                                Text("Event contributors: ${myFiltered[index]['event_participnats_count'].toString()}"),
                              ],
                            ),
                          ),
                        );
                      },
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
