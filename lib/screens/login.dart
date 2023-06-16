import 'package:appfood/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  late String email;
   late String password;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,
        vertical: 60),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/OP.jpg", height: 200,width: 250,),
              SizedBox(height:30),
              TextFormField(
               onChanged: (value){email = value;},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
               onChanged: (value) {password = value;},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                 
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: ()async{ var user = await auth.signInWithEmailAndPassword
                (email: email, password: password);
                if(user != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                }
                },
                
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 164, 73),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("Sign In", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I do not have an account!", style: TextStyle(fontSize: 17,
                  ),
                  ),
                  TextButton(onPressed: ()
                  {  Navigator.of(context).pushNamed('singup');},
                   child:Text("Sign Up",style: TextStyle(
                    color:  Color.fromARGB(255, 225, 164, 73),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),))
                
              ],)
            ],
          ),
          ),
        ),
      ),
    );
  }
}