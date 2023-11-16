
import 'package:flutter/material.dart';

class Kart extends StatelessWidget {
  const Kart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profuct Info"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child:CircleAvatar(
                child: Image.asset("images/SpringBoot.png",width: 600.0,),
                radius: 100.0,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Spring Boot Archetecture',style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('Duration 5Months',style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
