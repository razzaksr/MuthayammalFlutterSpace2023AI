import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Text('Image Samples'),centerTitle: true,
      ),
      body: Center(
        child: Image.asset('images/fsd.png'),
        // child: Image.network("https://picsum.photos/id/237/200/300"),
      ),
    )
  ));
}

// void main(){
//   runApp(MaterialApp(
//     home:Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Custom Text'
//         ),
//       ),
//       body:Center(
//         child: Text(
//           'My Custom Font',
//           style: TextStyle(
//             fontFamily: 'Kenia',
//             fontSize: 35.8
//           ),
//         ),
//       )
//     )
//   ));
// }


// void main(){
//   runApp(MaterialApp(
//     home:MEC_AI(),
//   ));
// }

class MEC_AI extends StatelessWidget {
  const MEC_AI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC First App'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Arificial Intelligence resources are about to build mindblowing CRUD APP',
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
    );
  }
}


// discovered text,center,scaffold, body, appbar, float button
// void main(){
//   runApp(MaterialApp(
//     home:Scaffold(
//       appBar: AppBar(
//         title: Text('MEC First App'),
//         backgroundColor: Colors.lightBlue,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'MEC AI resources are about to build mindblowing CRUD APP',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Monotype Corsiva',
//             color: Colors.lightBlue,
//             fontSize: 40.0
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.large(
//           onPressed: ()=>print("My Toast"),
//           backgroundColor: Colors.lightBlue,
//           child: Text(
//             'My Action',
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.white70
//             ),
//           ),
//       ),
//     )
//   ));
// }

// void main() {
//   runApp(MaterialApp(
//     home: Text("welcome to zealous tech corp internship"),
//   ));
// }