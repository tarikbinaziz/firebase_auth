import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/login_screen.dart';

class HomeScreen extends StatelessWidget {

 // final FirebaseUser user;

 // HomeScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Text("phoneNumber", style: TextStyle(color: Colors.grey, ),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginView()));}, child: Text("Log out"))
          ],
        ),
      ),
    );
  }
}