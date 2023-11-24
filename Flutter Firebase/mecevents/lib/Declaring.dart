import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/EventDrawer.dart';
import 'package:mecevents/ListEverything.dart';
import 'package:toast/toast.dart';
class Declaring extends StatefulWidget {
  // const Declaring({super.key});

  String current;
  Declaring(this.current);

  @override
  State<Declaring> createState() => _DeclaringState();
}

class _DeclaringState extends State<Declaring> {

  final fireObj=FirebaseFirestore.instance;

  var winnerController=TextEditingController();
  var runnerController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC Announce'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amberAccent,
      ),
      drawer: EventDrawer(),
      body: StreamBuilder(
        stream:fireObj.collection("symposium").doc(widget.current).get().asStream(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Text("No matched document",style: TextStyle(fontSize: 30.0),);
          }
          else{
            DocumentSnapshot snap = snapshot.data!;
            List<dynamic> myEnrolls = snap['event_participants'] as List<dynamic>;
            if(snap['event_winner']==""&&snap['event_runner']==""&&myEnrolls.length>=2){
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: myEnrolls.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.purple,
                          margin: EdgeInsets.all(4.0),
                          child: ListTile(
                            textColor: Colors.amberAccent,
                            leading: CircleAvatar(
                              child: Text(myEnrolls[index][0]),
                              radius: 10.0,
                            ),
                            title: Text(myEnrolls[index]),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30.0,),
                    TextField(
                      controller: winnerController,
                      decoration: InputDecoration(
                        hintText: "Announce Winner"
                      ),
                    ),
                    TextField(
                      controller: runnerController,
                      decoration: InputDecoration(
                          hintText: "Announce Runner"
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    OutlinedButton.icon(
                        onPressed: ()async{
                          String winnerValue=winnerController.text;
                          String runnerValue=runnerController.text;
                          if(winnerValue!=runnerValue){
                            if(myEnrolls.contains(winnerValue)&&myEnrolls.contains(runnerValue)){
                              await fireObj.collection("symposium").doc(widget.current).update({
                                "event_winner":winnerValue,
                                "event_runner":runnerValue
                              });
                              Toast.show("Winner and Runner declared");
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (context) => ListEverything(),)
                              );
                            }
                            else{
                              Toast.show("Winner / Runner not in the participants list");
                            }
                          }
                          else{
                            Toast.show("${winnerValue} can't be winner and runner");
                          }
                        },
                        icon: Icon(Icons.emoji_events_outlined,size: 14.0,),
                        label: Text('Announce')
                    )
                  ],
                ),
              );
            }
            else{
              return Text("Can't declare winner/ runner",style: TextStyle(fontSize: 30.0),);
            }
          }
        },
      ),
    );
  }
}
