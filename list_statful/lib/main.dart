import 'package:flutter/material.dart';
import 'package:list_statful/Loan.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(
    // home:BasicList()
    // home:UsersList()
    home:UserView()
  ));
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<dynamic> newArraivals=[
    Loan("Home Loan", "General", 8.4, 5000000, 300),
    Loan("Gold Loan", "General", 9.2, 2000000, 12),
    Loan("Personal Loan", "Employees", 16.8, 500000, 36),
    Loan("Educational Loan", "Students", 10.2, 800000, 64),
    Loan('Credit Card',"Business",13.7,100000,24)
  ];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Demo'),
      ),
      body:ListView.builder(
          itemCount: newArraivals.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  // print(newArraivals[index]);
                  Toast.show(newArraivals[index].toString(),duration: Toast.lengthLong);
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  child:Text(newArraivals[index].schemeName[0]),
                  radius: 50.0,
                ),
                title:Text(newArraivals[index].schemeName,
                  style: TextStyle(fontSize: 14.0,color: Colors.pink),),
                trailing: OutlinedButton.icon(
                    onPressed: (){setState(() {
                      newArraivals.removeAt(index);
                    });},
                    icon: Icon(Icons.delete_forever_outlined),
                    label: Text('Delete'),
                ),
              ),
            );
          }
      )
    );
  }
}


class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late VoidCallback pointer;
  List<dynamic> newArraivals=[
    Loan("Home Loan", "General", 8.4, 5000000, 300),
    Loan("Gold Loan", "General", 9.2, 2000000, 12),
    Loan("Personal Loan", "Employees", 16.8, 500000, 36),
    Loan("Educational Loan", "Students", 10.2, 800000, 64),
    Loan('Credit Card',"Business",13.7,100000,24)
  ];

  Widget MyCard(Loan e,delete){
    pointer=delete;
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Icon(Icons.monetization_on,size: 20.0,),
            radius: 10.0,
          ),
          SizedBox(width: 10,),
          Text("Loan Name ${e.schemeName}",style: TextStyle(fontSize: 18.0),),
          SizedBox(width: 10,),
          Text("Loan Eligible to ${e.schemeFor}",style: TextStyle(fontSize: 14.0),),
          SizedBox(width: 10,),
          Text("Loan Interest ${e.interest}",style: TextStyle(fontSize: 10.0),),
          SizedBox(width: 10,),
          Text("Loan Minimum Emi month ${e.minEMI}",style: TextStyle(fontSize: 10.0),),
          SizedBox(width: 10,),
          Text("Loan Maximum sanction ${e.maxLimit}",style: TextStyle(fontSize: 10.0),),
          SizedBox(width: 10,),
          OutlinedButton.icon(
              onPressed: pointer,
              icon: Icon(Icons.delete_forever_sharp),
              label: Text('Trash'),
          )
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
              MyCard(e,(){
                setState(() {
                  newArraivals.remove(e);
                });
              })
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
