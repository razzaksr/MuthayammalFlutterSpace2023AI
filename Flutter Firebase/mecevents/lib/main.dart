import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mecevents/ListEverything.dart';
import 'package:mecevents/NewEvent.dart';
import 'package:mecevents/SignIn.dart';
import 'package:mecevents/SignUp.dart';
import 'package:mecevents/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    // home:ListEverything()
    // home:SignUp()
    home:SignIn()
    // home:NewEvent()
  ));
}
