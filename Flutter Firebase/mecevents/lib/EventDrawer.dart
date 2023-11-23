import 'package:flutter/material.dart';
import 'package:mecevents/ListEverything.dart';
import 'package:mecevents/NewEvent.dart';
class EventDrawer extends StatefulWidget {
  const EventDrawer({super.key});

  @override
  State<EventDrawer> createState() => _EventDrawerState();
}

class _EventDrawerState extends State<EventDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purple,
      child: Card(
        color: Colors.amberAccent,
        child: ListView(
          children: [
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
            )
          ],
        ),
      ),
    );
  }
}
