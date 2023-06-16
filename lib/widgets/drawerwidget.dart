import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 50, 54, 56),
      child: ListView(
        children:[
           ListTile(
            
            leading: Icon(
              CupertinoIcons.home,
               color: Color.fromARGB(255, 225, 164, 73),
               ),
               title: Text("Home", 
               style: TextStyle(fontSize: 18, 
               fontWeight: FontWeight.bold,
               color: Colors.white,
               ),
               ),
               onTap: (){Navigator.pushNamed(context, "homepage");},
          ),
          
          ListTile(
            
            leading: Icon(
              CupertinoIcons.person,
               color: Color.fromARGB(255, 225, 164, 73),
               ),
               title: Text("My Account", 
               style: TextStyle(fontSize: 18, 
               fontWeight: FontWeight.bold,
               color: Colors.white,
               ),
               ),
               onTap: (){Navigator.pushNamed(context, "myaccount");},
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
               color: Color.fromARGB(255, 225, 164, 73),
               ),
               title: Text("Settings", 
               style: TextStyle(fontSize: 18, 
               fontWeight: FontWeight.bold,
               color: Colors.white,
               ),
               ),
               onTap: (){Navigator.pushNamed(context, "settingsscreen");},
          ),
           ListTile(
            leading: Icon(
              Icons.cloud,
               color: Color.fromARGB(255, 225, 164, 73),
               ),
               title: Text("Wheather", 
               style: TextStyle(fontSize: 18, 
               fontWeight: FontWeight.bold,
               color: Colors.white,
               ),
               ),
               onTap: (){Navigator.pushNamed(context, "currentWeather");},
          ),
           ListTile(
            leading: Icon(
              Icons.exit_to_app,
               color: Color.fromARGB(255, 225, 164, 73),
               ),
               title: Text("Log Out", 
               style: TextStyle(fontSize: 18, 
               fontWeight: FontWeight.bold,
               color: Colors.white,
               ),
               ),
               onTap: (){Navigator.pushNamed(context, "logoutscreen");},
          ),
      ],
      ),
    );
  }
}