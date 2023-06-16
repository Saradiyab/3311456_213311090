import 'package:appfood/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String Password; 
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
                onChanged: (value){
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
             
               SizedBox(height: 20),
               TextFormField(
                onChanged: (value){
                  Password = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                 
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: ()async
                {var user =  await auth.createUserWithEmailAndPassword(email: email, password: Password);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),); },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 164, 73),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("Create an account", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("if you have an account!", style: TextStyle(fontSize: 17,
                  ),
                  ),
                  TextButton(onPressed: ()
                  {  Navigator.of(context).pushNamed('login');},
                   child:Text("Click Here",style: TextStyle(
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