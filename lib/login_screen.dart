
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/home.dart';

class LoginView extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var ourOtp = "";
  var veriId = "";

  sendOtp(number) async {
    auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
        },
        codeSent: (verificationId, codeSent) {
          veriId = verificationId;
        },
        codeAutoRetrievalTimeout: (val) {});
  }

  login(context) async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: veriId, smsCode: passwordController.text);
      auth.signInWithCredential(credential);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>HomeScreen()));

    }on FirebaseAuthException catch(e){
      print(e.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: "enter phone no"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "enter password no"),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {
                  sendOtp(phoneController.text);

                }, child: Text("send otp")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {

                  login(context);
                }, child: Text("log in")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
