import 'package:flutter/material.dart';
import 'package:nulaundry/splash.dart';
import 'package:nulaundry/viewall.dart';
import 'package:nulaundry/viewlaundry.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:nu_laundry/show.dart';

// import 'homescreen.dart';

class MainMenu extends StatefulWidget {
  var name;
  var bagcode;
  MainMenu({this.bagcode,this.name});
  // const MainMenu({ Key? key }) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // int bagcode=456;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff125B50),
     appBar: AppBar(
actions: [

IconButton(onPressed: () async {
  var prefs = await SharedPreferences.getInstance();
 prefs.setInt("bagid",99999).then((valuse)=>{

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Splash()))

        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainMenu()))


  });




}, icon: Icon(Icons.logout))

],

  leading: Padding(

    padding: const EdgeInsets.fromLTRB(20, 0  , 0, 0),
    child: Image.asset("assets/washlogo.png",height: 50,),
  ),
  backgroundColor: Color(0xff6736FF),
  title: Text("Hello "+widget.name.toString() ,style: TextStyle(letterSpacing: 3),),
),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [



GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>viewlaundry(usercode: widget.bagcode,)));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Container(
  decoration: BoxDecoration(
      color: Color(0xffF8B400),
  borderRadius: BorderRadius.circular(20)
  ),
      height: MediaQuery.of(context).size.height*0.3,
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/clothes.png",height: 120,)
    ,      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Up coming Laundry",style: TextStyle(color: Color(0xffFAF5E4),fontWeight: FontWeight.w600,fontSize: 25),),
    ),
        ],
      )),
    
    ),
  ),
),

GestureDetector(
  onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll(usercode: widget.bagcode,)));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Container(
      decoration: BoxDecoration(
       color: Color(0xffFF6363),
  
  borderRadius: BorderRadius.circular(20)
  ),
       height: MediaQuery.of(context).size.height*0.3,
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image.asset("assets/return.png",height: 120,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("View All Laundry",style: TextStyle(color: Color(0xffFAF5E4),fontWeight: FontWeight.w600,fontSize: 25)),
          ),
        ],
      )),
    ),
  ),
),




],),
    );
  }
}