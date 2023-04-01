import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nulaundry/singleview.dart';
import 'package:nulaundry/viewlaundry.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewAll extends StatefulWidget {
  // const ViewAll({ Key? key }) : super(key: key);
  var usercode;
  ViewAll({this.usercode});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
final supabase = SupabaseClient('https://ayywccxhnqffassgwdxx.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF5eXdjY3hobnFmZmFzc2d3ZHh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAzOTQzMzcsImV4cCI6MTk2NTk3MDMzN30.wzWToML_bkULugTsTMRICE1RgWDh_Rm-lAuMD1UpOFc');

bool isloading=true;
var tails=[];

  @override
  Widget build(BuildContext context) {
 if(isloading){
   return Center(child: CircularProgressIndicator(),);

 }
 else{
      return Scaffold(
      appBar:AppBar(

        
        elevation: 0,
        title: Text("View All Orders",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Color(0xff6736FF),),onPressed: (){

          Navigator.pop(context);
        },),
        backgroundColor: Color(0xffF0F0F0)
      ),

      body: tails.length>0?ListView.builder(
        itemCount: tails.length,
        itemBuilder: (context,index){
        return Padding(
  padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
  child:   ListTile(
    onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=>singleview(
  usercode: widget.usercode,
  timestamp:  tails[index]["order_time"],
  
)));

      // DateTime.fromMillisecondsSinceEpoch(millis)
    },
    title: Text(tails[index]["recived"],style: TextStyle(fontSize: 18),),
    trailing: tails[index]["isreturn"]?Text("Returned",style: TextStyle(color: CupertinoColors.activeGreen,fontSize: 20),):Text(tails[index]["return"],style: TextStyle(color: CupertinoColors.systemRed,fontSize: 20),),
    leading: Image.asset("assets/shirt.png"),
  
  ),
);

      }):Center(child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [


Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
  child:   Image.asset("assets/washlogo.png",height: 120,),
),


Text("No Orders Found",style: TextStyle(color: Colors.black,fontSize: 22),)


],)),
    );
 }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
loaddata();

  }

  void loaddata(){

supabase.from("orders").select("*").match({
  "bagid":widget.usercode,
}).order("order_time",ascending: true).execute().then((value)  {




setState(() {
  isloading=false;
  tails=value.data;
});




});




  }
}