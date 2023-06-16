import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Container(
                      child:ElevatedButton(
                        style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 225, 164, 73),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), 
                            ),
                          ),
                        ),
                   onPressed: (){
              showDialogWidget(context);
                    },
                    child: Text("Log Out",
                     style:TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, 
                           color:Colors.white,
                         ),
                     ),
                   
                   ),
                   ),
            ),
        ),
    );
  }
}

showDialogWidget(BuildContext context){
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromARGB(255, 50, 54, 56), 
    title: Text("Log Out",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    content: Text("Would you really want to log out from this app?",
    style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    actions: [
      TextButton(onPressed:
       (){ Navigator.of(context).pushNamed('homepage');},
       child: Text("Cancel",
       style:TextStyle(
        color: Colors.white),
       ),
       ),
      TextButton(
        onPressed: (){ Navigator.of(context).pushNamed('singup');},
        child: Text("Log Out",
        style:TextStyle(
        color: Colors.white),
        ),
        ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
}

