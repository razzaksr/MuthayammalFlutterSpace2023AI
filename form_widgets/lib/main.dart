import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(
    home: TextBoxDemo(),
  ));
}

class TextBoxDemo extends StatefulWidget {
  const TextBoxDemo({super.key});

  @override
  State<TextBoxDemo> createState() => _TextBoxDemoState();
}

class _TextBoxDemoState extends State<TextBoxDemo> {

  var applicantNameController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Card(
          margin: EdgeInsets.all(50),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: applicantNameController,
                  decoration: InputDecoration(hintText: "Applicant name"),
                ),
                OutlinedButton.icon(
                    onPressed: (){
                      Toast.show(applicantNameController.text);
                    },
                    icon: Icon(Icons.view_agenda_outlined),
                    label: Text('View')
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
