import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Dare(),
  ));
}

class Dare extends StatefulWidget {
  const Dare({super.key});

  @override
  State<Dare> createState() => _DareState();
}

class _DareState extends State<Dare> {

  int myScore=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Game'),
      ),
      body: Center(
        child: OutlinedButton.icon(
            onPressed: (){
              setState(() {
                myScore++;
              });
            },
            icon: Icon(Icons.accessible_forward_outlined),
            label: Text('${myScore}')
        ),
      ),
    );
  }
}
