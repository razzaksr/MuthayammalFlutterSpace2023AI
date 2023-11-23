import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/EventDrawer.dart';
import 'package:toast/toast.dart';
class ListEverything extends StatefulWidget {
  const ListEverything({super.key});

  @override
  State<ListEverything> createState() => _ListEverythingState();
}

class _ListEverythingState extends State<ListEverything> {

  final fireStoreObject = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC View'),
        centerTitle: true,
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.purple,
      ),
      drawer: EventDrawer(),
      body:StreamBuilder(
        stream: fireStoreObject.collection("symposium").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: Text('No documents are available'),
            );
          }
          else{
            List<DocumentSnapshot> documents=snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.purple,
                  margin: EdgeInsets.all(12.0),
                  child: ListTile(
                    onTap: (){

                    },
                    textColor: Colors.amberAccent,
                    leading: CircleAvatar(
                      child: Text(documents[index]['event_name'][0]),
                      radius: 20.0,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Event Name: ${documents[index]['event_name']}"),
                        Text("Event Id: ${documents[index]['event_id']}"),
                        Text("Event contributors: ${documents[index]['event_participnats_count'].toString()}"),
                      ],
                    ),
                    trailing: PopupMenuButton(
                      color: Colors.amberAccent,
                      itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(child: Text('Edit')),
                        PopupMenuItem(child: Text('Delete')),
                      ];
                    },),
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
