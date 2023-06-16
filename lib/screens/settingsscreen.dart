import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color:Colors.white.withOpacity(0.5),

                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enable Notifications',
                    style: TextStyle(fontSize: 16),
                    
                  ),
                  Switch(
                    value: enableNotifications,
                    onChanged: (value) {
                      setState(() {
                        enableNotifications = value;
                      });
                    },
                     activeColor: Color.fromARGB(255, 225, 164, 73), 
                    inactiveTrackColor: Colors.grey, 
                  ),
                ],
              ),
            ),
          SizedBox(height: 10),
            ListTile(
              onTap: () {
                showDialog(

                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('About', style: TextStyle(color: Colors.white)),
                       backgroundColor:Color.fromARGB(255, 50, 54, 56),
                      content: SingleChildScrollView(
                        child: Text(
                          'App Version: 1.0.0 , The app was programmed and developed by the Software Development Team',
                          style: TextStyle(color: Colors.white),
                          ),
                      
          
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close', style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}
