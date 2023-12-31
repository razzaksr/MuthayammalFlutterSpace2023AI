import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/ListEverything.dart';
import 'package:mecevents/SignUp.dart';
import 'package:toast/toast.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  var mobileController=TextEditingController();
  var otpController=TextEditingController();

  String secretId="";

  final authentication=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('MEC Events SignIn'),
            centerTitle: true,
            backgroundColor: Colors.purple,
            foregroundColor: Colors.amberAccent,
            bottom: TabBar(
              indicator: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              tabs: [
                Tab(
                  child: Icon(Icons.email)
                ),
                Tab(
                    child: Icon(Icons.mobile_friendly)
                )
              ],
            ),
          ),
          body:TabBarView(
            children: [
              Center(
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
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        SizedBox(height: 25.0,),
                        OutlinedButton.icon(
                            onPressed: (){
                              // Toast.show("${emailController.text} ${passwordController.text}");
                              authentication.signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text
                              );
                              Toast.show("SignIN success",duration: Toast.lengthLong);
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => ListEverything(),
                              ));
                            },
                            icon: Icon(Icons.login_outlined),
                            label: Text("SignIn")
                        )
                      ],
                    ),
                  )
              ),
              Center(
                  child:Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: mobileController,
                          decoration: InputDecoration(
                              hintText: "Mobile Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        OutlinedButton.icon(
                            onPressed: ()async{
                              authentication.verifyPhoneNumber(
                                  phoneNumber: mobileController.text,
                                  verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
                                    await authentication.signInWithCredential(phoneAuthCredential);
                                  },
                                  verificationFailed: (error) => Toast.show("Invalid credentials"),
                                  codeSent: (String verificationId,int? forceResendingToken) {
                                    setState(() {
                                      secretId=verificationId;
                                    });
                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {
                                    secretId=verificationId;
                                  },
                              );
                            },
                            icon: Icon(Icons.send),
                            label: Text("Send OTP")
                        ),
                        SizedBox(height: 20.0,),
                        TextField(
                          obscureText: true,
                          controller: otpController,
                          decoration: InputDecoration(
                              hintText: "OTP",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        SizedBox(height: 25.0,),
                        OutlinedButton.icon(
                            onPressed: ()async{
                              PhoneAuthCredential credentials=PhoneAuthProvider.credential(
                                  verificationId: secretId,
                                  smsCode: otpController.text
                              );
                              await authentication.signInWithCredential(credentials);
                              Toast.show("SignIn success");
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => ListEverything(),
                              ));
                            },
                            icon: Icon(Icons.login_outlined),
                            label: Text("SignIn")
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SignUp(),
                ));
              },
              child:Icon(Icons.app_registration)
          ),
        )
    );
  }
}
