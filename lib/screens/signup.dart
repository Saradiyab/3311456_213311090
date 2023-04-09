import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:
           Image.asset("images/OP.jpg",
           height: 200,),
           ),
           Container(
            padding: EdgeInsets.all(20),
             child: Form(child: Column(
              children: [
           
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1)
                    ),
           
                  ),
                ) , 
                SizedBox(height: 20) ,

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 20) ,

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1))),
                ),
                
                Container(
                  margin: EdgeInsets.all(10),
                  child:Row(
                    children:[
                  Text("if you have an account!"),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text("Click Here" , 
                  style:TextStyle(color: Colors.black),
                  ),)

                ]),),

                Container(
                  child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 225, 164, 73)),
                    onPressed: () {}, 
                    child:Text("Create an account" , 
                    style: TextStyle(fontSize: 20),),
              ) ),
              ],
             )),
           )

        ],
      )
    );
  }
}