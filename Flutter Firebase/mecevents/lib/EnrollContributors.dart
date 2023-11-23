import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/EventDrawer.dart';
import 'package:toast/toast.dart';
class EnrollContributors extends StatefulWidget {
  // const EnrollContributors({super.key});

  String id;
  EnrollContributors(this.id);

  @override
  State<EnrollContributors> createState() => _EnrollContributorsState();
}

class _EnrollContributorsState extends State<EnrollContributors> {

  final storeObj=FirebaseFirestore.instance;

  var enrollController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC enroll particpants'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amberAccent,
      ),
      drawer: EventDrawer(),
      body: StreamBuilder(
        // stream:storeObj.collection("symposium").
        // where("Document ID",isEqualTo: widget.id).
        // where("event_winner",isEqualTo: "").
        // where("event_runner",isEqualTo: "").
        // get().asStream(),
        stream: storeObj.collection("symposium").doc(widget.id).get().asStream(),
        builder: (BuildContext context,AsyncSnapshot snapshot) {
          if(!snapshot.hasData){
            return Text('invalid document');
          }
          else{
            DocumentSnapshot snap = snapshot.data;
            if(snap['event_winner']=="" && snap['event_runner']==""){
              List<dynamic> myList = snap['event_participants'] as List<dynamic>;
              int count = snap["event_participnats_count"];
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: enrollController,
                        decoration: InputDecoration(
                          hintText: "Participant name",

                        ),
                      ),
                      OutlinedButton.icon(
                          onPressed: ()async{
                            myList.add(enrollController.text);
                            count++;
                            storeObj.collection("symposium").doc(widget.id).update({
                              "event_participants": myList,
                              "event_participnats_count":count
                            });
                            Toast.show("${enrollController.text} enrolled",duration: Toast.lengthLong);
                          },
                          icon: Icon(Icons.add),
                          label: Text("Register")
                      )
                    ],
                  ),
                ),
              );
            }
            else{
              return Center(
                child: Text("Event has ended",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              );
            }
          }
        },
      ),
    );
  }
}
