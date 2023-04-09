import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1))),
                ), 
                Container(
                  margin: EdgeInsets.all(10),
                  child:Row(
                    children:[
                  Text("I do not have an account!"),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('singup');
                    },
                    child: Text("Click Here" , 
                  style:TextStyle(color: Colors.black),
                  ),)

                ]),),

                Container(
                  child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 225, 164, 73)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('homepage');
                    }, 
                    child:Text("Sign In" , 
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