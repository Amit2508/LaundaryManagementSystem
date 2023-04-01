import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nu_laundry/main.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:intl/intl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

TextEditingController _numberbox=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6736FF),


 appBar: AppBar(

        
        elevation: 0,
        title: Text("Pick-Up",style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),onPressed: (){

          Navigator.pop(context);
        },),
        backgroundColor: Color(0xff6736FF)
      ),


body: Column(children: [

Padding(
  padding: const EdgeInsets.fromLTRB(60, 60, 60, 60),
  child:   Image.network("https://cdn-icons-png.flaticon.com/512/3440/3440626.png"),
),




Pinput(
  onChanged: (ee){
    setState(() {
      
    });
  },
  controller: _numberbox,
      onCompleted: (value){

       
      }
    ),


Padding(
  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
  child:   CupertinoButton(
    
    // color: Color(0xffFFB3A6),
    color: _numberbox.text.length>0? Color(0xffFFB3A6):Colors.grey,
    
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Next",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,letterSpacing: 2),),
    ), onPressed: (){
      print(_numberbox.text);



//  getdata();
if(_numberbox.text.length>0){
Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(usercode: int.parse(_numberbox.text),)));

}





    }),
)



]),

    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // getdata();
  }


}