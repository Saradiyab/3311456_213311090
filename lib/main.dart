
import 'package:appfood/home/homepage.dart';
import 'package:appfood/screens/logoutscreen.dart';
import 'package:appfood/screens/myaccount.dart';
import 'package:appfood/screens/notifications.dart';
import 'package:appfood/screens/login.dart';
import 'package:appfood/screens/orders.dart';
import 'package:appfood/screens/settingsscreen.dart';
import 'package:appfood/screens/signup.dart';
import 'package:appfood/screens/currentWeather.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var p1 = await getApplicationDocumentsDirectory();
  Hive.init(p1.path);
  var myHive = Hive.openBox('test');
  
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
        "notifications":(context) => Notifications(),
        "orders":(context) =>Orders(),
        "logoutscreen":(context) =>  LogoutScreen(),
        "currentWeather":(context) => CurrentWeather(),
        "myaccount":(context) =>  MyAccount(),
        "settingsscreen":(context) => SettingsScreen(),
      
       
      },

     
    );
  }

}