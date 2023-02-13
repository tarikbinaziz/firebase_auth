import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/home.dart';
import 'package:phone_auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth=FirebaseAuth.instance;
  bool isLogIn=false;

  checkIfLogin(){
    auth.authStateChanges().listen((User? user) {
      if(user!=null&&mounted)
      setState(() {
        isLogIn=true;
      });
    });

  }
  @override
  void initState() {
    checkIfLogin();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogIn?HomeScreen():LoginView(),
    );

  }
}




