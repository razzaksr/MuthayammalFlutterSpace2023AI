
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Card'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child:Image.asset("images/zealous.png",height: 190.0,)
            ),
            Center(
              child: Image.asset("images/razak.png",height: 230.0,),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Emp Name',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Razak Mohamed S',style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic
                  ),)
                ],
              ),

            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Emp Designation',
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Founder | L&D Manager',style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic
                  ),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.email_sharp,color: Colors.lightBlue,size: 15.0,),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('razaksrmd@gmail.com',style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic
                  ),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
