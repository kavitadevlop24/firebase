



import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_module/Screens/homescreen.dart';
import 'package:firebase_module/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  signIn(String email,String password) async {
    if(email=="" && password==""){
      return log("Enter Required Field");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        });
      }
      on FirebaseAuthException catch(ex){
        return log(ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              emailController, "Enter Email", Icons.email, false),
          UiHelper.CustomTextField(
              passController, "Enter Password", Icons.password, true),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            signIn(emailController.text.toString(), passController.text.toString());
          }, child: Text("SignIn"))
        ],
      ),
    );
  }
}
