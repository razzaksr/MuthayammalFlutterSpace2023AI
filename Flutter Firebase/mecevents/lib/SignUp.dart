import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  final authentication=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MEC Events SignUP'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amberAccent,
      ),
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Set Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              SizedBox(height: 25.0,),
              OutlinedButton.icon(
                  onPressed: ()async{
                    await authentication.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text
                    );
                    Toast.show("SignUp success",duration: Toast.lengthLong);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.person_add),
                  label: Text("SignUP")
              )
            ],
          ),
        )
      ),
    );
  }
}
