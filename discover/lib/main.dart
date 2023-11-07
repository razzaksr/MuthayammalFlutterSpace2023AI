import 'package:flutter/material.dart';

// discovered text,center,scaffold, body, appbar, floatbutton
void main(){
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Text('MEC First App'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MEC AI resources are about to build mindblowing CRUD APP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Monotype Corsiva',
            color: Colors.lightBlue,
            fontSize: 40.0
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
          onPressed: ()=>print("My Toast"),
          backgroundColor: Colors.lightBlue,
          child: Text(
            'My Action',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white70
            ),
          ),
      ),
    )
  ));
}

// void main() {
//   runApp(MaterialApp(
//     home: Text("welcome to zealous tech corp internship"),
//   ));
// }