import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_module/Screens/homescreen.dart';
import 'package:firebase_module/Screens/signin_screen.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }
  checkuser(){
    final user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      return HomeScreen();
    }
    else{
      return SignInScreen();
    }
  }
}
