import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(
    // home: ButtonsDemo(),
    home:ContainersDemo()
  ));
}

class ContainersDemo extends StatelessWidget {
  const ContainersDemo({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Containers'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        // margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        // color: Colors.black,
        // child: OutlinedButton(
        //   onPressed: (){Toast.show("Mytoast access",duration: Toast.lengthLong);},
        //   child: Text('Outlined'),
        // ),
        child: OutlinedButton.icon(
          onPressed: (){Toast.show("Mytoast access",duration: Toast.lengthLong);},
          label:Text('Outlined Button'),
          icon: Icon(Icons.account_balance),
        ),
      ),
    );
  }
}


class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons and containers'),
        foregroundColor: Colors.lightBlue,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child:ElevatedButton.icon(
            onPressed: (){Toast.show("My Toast on Elevated Icon Button",duration: Toast.lengthLong);},
            icon: Icon(Icons.ac_unit_sharp),
            label: Text('My Icon')
        )
        // child: ElevatedButton(
        //   onPressed: (){
        //     Toast.show("My Toast on Elevated Button",duration: Toast.lengthLong);
        //   },
        //   child: Text('My Elevated Button'),
        // ),
      ),
    );
  }
}
