import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nulaundry/Homepage.dart';
import 'package:nulaundry/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trace_pharma/dashboard.dart';
// import 'package:trace_pharma/main.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Image.asset("assets/washlogo.png",height: 80,),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    checkstatus();
  }

  Future<void> checkstatus() async {

    final prefs = await SharedPreferences.getInstance();

    var data=prefs.get('bagid');
    var name=prefs.get("name");
    if(data==null||data==""||data=="null"||data==99999){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }
    else{
      print(data);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenu(bagcode: data,name: name,)));    }

  }
}
