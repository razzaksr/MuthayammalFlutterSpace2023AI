import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/EventDrawer.dart';
import 'package:toast/toast.dart';
class NewEvent extends StatefulWidget {
  const NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  
  final fireStoreObj = FirebaseFirestore.instance;

  var idController=TextEditingController();
  var nameController=TextEditingController();
  var dateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC New Event'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amberAccent,
      ),
        drawer: EventDrawer(),
      body:Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            color: Colors.purple,
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    style: TextStyle(color:Colors.amberAccent),
                    controller: idController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Event ID",
                    ),
                  ),
                  TextField(
                    style: TextStyle(color:Colors.amberAccent),
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Event Name",
                    ),
                  ),
                  TextField(
                    style: TextStyle(color:Colors.amberAccent),
                    controller: dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Event Date YYYY-MM-DD",
                    ),
                  ),
                  OutlinedButton.icon(
                      onPressed: ()async{
                        Map<String,dynamic> document={
                          "event_id":idController.text,
                          "event_name":nameController.text,
                          "event_date":DateTime.parse(dateController.text),
                          "event_participants":[],
                          "event_participnats_count":0,
                          "event_winner":"",
                          "event_runner":""
                        };
                        await fireStoreObj.collection("symposium").add(document);
                        Toast.show("Event Created",duration: Toast.lengthLong);
                      },
                      icon: Icon(Icons.event),
                      label: Text("Add event")
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
