import 'package:flutter/material.dart';
import 'package:list_statful/Loan.dart';

void main() {
  runApp(MaterialApp(
    // home:BasicList()
    home:UsersList()
  ));
}

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<dynamic> newArraivals=[
    Loan("Home Loan", "General", 8.4, 5000000, 300),
    Loan("Gold Loan", "General", 9.2, 2000000, 12),
    Loan("Personal Loan", "Employees", 16.8, 500000, 36),
    Loan("Educational Loan", "Students", 10.2, 800000, 64),
    Loan('Credit Card',"Business",13.7,100000,24)
  ];

  Widget MyCard(Loan e){
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            child: Icon(Icons.monetization_on,size: 20.0,),
            radius: 10.0,
          ),
          Text("Loan Name ${e.schemeName}",style: TextStyle(fontSize: 18.0),),
          Text("Loan Name ${e.schemeFor}",style: TextStyle(fontSize: 14.0),),
          Text("Loan Name ${e.interest}",style: TextStyle(fontSize: 10.0),),
          Text("Loan Name ${e.minEMI}",style: TextStyle(fontSize: 10.0),),
          Text("Loan Name ${e.maxLimit}",style: TextStyle(fontSize: 10.0),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card with Custom Objects'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: newArraivals.map((e) =>
              MyCard(e)
          ).toList(),
        ),
        // child: Card(
        //   margin: EdgeInsets.all(10.5),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: newArraivals.map((e) => Text("$e")).toList(),
        //   ),
        //
        // ),
      )
    );
  }
}


class BasicList extends StatefulWidget {
  const BasicList({super.key});

  @override
  State<BasicList> createState() => _BasicListState();
}

class _BasicListState extends State<BasicList> {
  List<String> currentOpenings=[
    'Back end developer','Data analytics','Flutter developer',
    'Product Support','CCNA'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic way to view list'),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
            // Text("${currentOpenings.toString()}")
            currentOpenings.map(
                    (e) => Text(
                      e,style: TextStyle(
                        color: Colors.teal,fontSize: 24.0
                      ),
                    )).toList(),
        )
      )
    );
  }
}
