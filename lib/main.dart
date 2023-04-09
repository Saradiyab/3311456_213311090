import 'package:appfood/home/homepage.dart';
import 'package:appfood/screens/login.dart';
import 'package:appfood/screens/signup.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp ({super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "login": (context) => Login(),
        "singup":(context) => SingUp(),
        "homepage":(context) => HomePage(),
      },

     
    );
  }

}