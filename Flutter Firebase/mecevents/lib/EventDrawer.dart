import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/ListEverything.dart';
import 'package:mecevents/NewEvent.dart';
import 'package:mecevents/Shortlist.dart';
import 'package:mecevents/SignIn.dart';
class EventDrawer extends StatefulWidget {
  const EventDrawer({super.key});

  @override
  State<EventDrawer> createState() => _EventDrawerState();
}

class _EventDrawerState extends State<EventDrawer> {
  final authentication = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purple,
      child: Card(
        color: Colors.amberAccent,
        child: ListView(
          children: [
            ListTile(
              title: Text(authentication.currentUser!.email.toString(),style: TextStyle(color: Colors.purple),),
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(
                  builder: (context) => ListEverything(),
                ));
              },
            ),
            ListTile(
              title: Text('View All Events',style: TextStyle(color: Colors.purple),),
              leading: CircleAvatar(
                child: Icon(Icons.view_agenda_outlined),
              ),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(
                  builder: (context) => ListEverything(),
                ));
              },
            ),
            ListTile(
              title: Text('New Events',style: TextStyle(color: Colors.purple),),
              leading: CircleAvatar(
                child: Icon(Icons.event_available),
              ),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(
                  builder: (context) => NewEvent(),
                ));
              },
            ),
            ListTile(
              title: Text('Shortlist Events',style: TextStyle(color: Colors.purple),),
              leading: CircleAvatar(
                child: Icon(Icons.filter_alt_outlined),
              ),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(
                  builder: (context) => Shortlist(),
                ));
              },
            ),
            ListTile(
              title: Text('Logout',style: TextStyle(color: Colors.purple),),
              leading: CircleAvatar(
                child: Icon(Icons.person_remove_alt_1),
              ),
              onTap: (){
                authentication.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(
                  builder: (context) => SignIn(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
