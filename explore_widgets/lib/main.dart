import 'package:explore_widgets/BusinessCard.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(
    // home: ButtonsDemo(),
    // home:ContainersDemo()
    // home:RowDemo()
    // home:ColumnDemo()
    // home:ExpandDemo()
    home:BusinessCard()
  ));
}

class ExpandDemo extends StatelessWidget {
  const ExpandDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('column alignment demo'),
          centerTitle: true,
        ),
        body:Container(
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Icon(
                      Icons.account_circle,color: Colors.white,size: 35.0
                  )),
              Expanded(
                flex: 2,
                  child: Icon(
                      Icons.person_remove_alt_1_rounded,color: Colors.white,size: 15.0
                  )),
              Expanded(child: Icon(Icons.list_alt_sharp,color: Colors.white,size: 25.0)),
            ],
          ),
        )
    );
  }
}


class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('column alignment demo'),
        centerTitle: true,
      ),
      body:Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle,color: Colors.white,size: 35.0,),
            Icon(Icons.person_remove_alt_1_rounded,color: Colors.white,size: 15.0,),
            Icon(Icons.list_alt_sharp,color: Colors.white,size: 25.0,),
          ],
        ),
      )
    );
  }
}


class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row alignment demo'),
      ),
      body:Container(
        color: Colors.cyanAccent,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Username',style: TextStyle(color: Colors.pink),),
            Icon(Icons.access_time_filled,color: Colors.pink,size: 50.4),
            OutlinedButton(onPressed: (){}, child: Text('MyButton',style: TextStyle(color: Colors.pink),))
          ],
        ),
      )
    );
  }
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
