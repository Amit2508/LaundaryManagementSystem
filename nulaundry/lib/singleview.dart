import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class singleview extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  var usercode;
  var timestamp;
  
  

singleview({this.usercode,this.timestamp});

  @override
  State<singleview> createState() => _singleviewState();
}

class _singleviewState extends State<singleview> {
final supabase = SupabaseClient('https://ayywccxhnqffassgwdxx.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF5eXdjY3hobnFmZmFzc2d3ZHh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAzOTQzMzcsImV4cCI6MTk2NTk3MDMzN30.wzWToML_bkULugTsTMRICE1RgWDh_Rm-lAuMD1UpOFc');

int totalpairs=0;
var userdata;
int shirts=0;
bool isdone=false;
int tshirts=0;
int pants=0;
int shorts=0;
int other=0;

bool isloading=true;
bool issameday=false;
bool _userfound=true;
var returndays={
  "Monday":"Thursday",
  "Tuesday":"Friday",
  "Wednesday":"Saturday",
  "Thursday":"Sunday",
  "Friday":"Monday",
  "Saturday":"Tuesday",
  "Sunday":"Wednesday"
};
  @override
  Widget build(BuildContext context) {

if(isloading==true){
return Center(child: CircularProgressIndicator(),);

}

else{

 if(_userfound){
     return Scaffold(
      appBar: AppBar(

        
        elevation: 0,
        title: Text("view Laundry ",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Color(0xff6736FF),),onPressed: (){

          Navigator.pop(context);
        },),
        backgroundColor: Color(0xffF0F0F0)
      ),
      backgroundColor: Color(0xffF0F0F0),

      body: SafeArea(
        child: issameday?Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
      
//       ListTile(
// leading: Image.asset("assets/shirt.png",height: 20,),

//         tileColor: Color(0xffFFFFFF),
        
//         title: Text("T-Shirt",style: TextStyle(
//           color: Color(0xff3A2D48),
//           fontWeight: FontWeight.w600,
//           fontSize: 18
//         ),),
//       )
      



      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          height: 90,
     
          width: MediaQuery.of(context).size.width,




decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(19)
),


child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

       Image.asset("assets/tshirt.png",height: 40,),

       Text("T-Shirt",style: TextStyle(color: Color(0xff473B56),fontWeight: FontWeight.w600,fontSize: 18),),


       Row(children: [



Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  child:   Text("$tshirts",style: TextStyle(color: Color(0xff4A3D57),fontWeight: FontWeight.w600,fontSize:20,),)
),







       ],)



],),



        ),
      ),




      /////// shirt
    

    Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          height: 90,
     
          width: MediaQuery.of(context).size.width,




decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(19)
),


child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

       Image.asset("assets/shirt.png",height: 40,),

       Text("Shirt",style: TextStyle(color: Color(0xff473B56),fontWeight: FontWeight.w600,fontSize: 18),),


       Row(children: [



Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  child:   Text("$shirts",style: TextStyle(color: Color(0xff4A3D57),fontWeight: FontWeight.w600,fontSize:20,),)
),





       ],)



],),



        ),
      ),



/// pants 

    Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          height: 90,
     
          width: MediaQuery.of(context).size.width,




decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(19)
),


child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

       Image.asset("assets/pants.png",height: 40,),

       Text("Pants",style: TextStyle(color: Color(0xff473B56),fontWeight: FontWeight.w600,fontSize: 18),),


       Row(children: [




Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  child:   Text("$pants",style: TextStyle(color: Color(0xff4A3D57),fontSize:20,),)
),








       ],)



],),



        ),
      ),
    





///  shorts 


    Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          height: 90,
     
          width: MediaQuery.of(context).size.width,




decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(19)
),


child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

       Image.asset("assets/short.png",height: 40,),

       Text("Shorts",style: TextStyle(color: Color(0xff473B56),fontWeight: FontWeight.w600,fontSize: 18),),


       Row(children: [




Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  child:   Text("$shorts",style: TextStyle(color: Color(0xff4A3D57),fontSize:20,),)
),









       ],)



],),



        ),
      ),



      //// other 
    
        Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          height: 90,
     
          width: MediaQuery.of(context).size.width,




decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(19)
),


child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

       Image.asset("assets/tie.png",height: 40,),

       Text("Other",style: TextStyle(color: Color(0xff473B56),fontWeight: FontWeight.w600,fontSize: 18),),


       Row(children: [


Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  child:   Text("$other",style: TextStyle(color: Color(0xff4A3D57),fontSize:20,),)
),






       ],)



],),



        ),
      ),

Padding(
  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
  child:   Text("Total : "+(shirts+tshirts+pants+shorts+other).toString(),style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,letterSpacing: 2
  
  
  ),),
),

Padding(
  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  child:   Container(
    height: 50,
    width: MediaQuery.of(context).size.width,
    child:   CupertinoButton(
    color: (shirts+tshirts+pants+shorts+other)>0?Color(0xff5EBC9C):Colors.grey,
      
      child: Text("Back",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),), onPressed: (){


Navigator.pop(context);




      }),
  ),
)


          
        ],):Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 20),
              child: Image.asset("assets/notime.png",height: 120,),
            ),
            Text("you cant give today ",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
          ],
        ),),
      ),

    );
 }else{

////////////////////
//////////////////
///
///
///
///
///
///
///
///
///
///

  return Scaffold(
      appBar: AppBar(

        
        elevation: 0,
        title: Text("No Laundry Found",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Color(0xff6736FF),),onPressed: (){

          Navigator.pop(context);
        },),
        backgroundColor: Color(0xffF0F0F0)
      ),
      backgroundColor: Color(0xffF0F0F0),


body: Center(child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [


Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
  child:   Image.asset("assets/washlogo.png",height: 120,),
),


Text("No Laundry Found",style: TextStyle(color: Colors.black,fontSize: 22),)


],)),

    );

 }
}
   
  }


  void removecloth(item){
    if(item=="tshirt"){
if(tshirts>0){
         tshirts=tshirts-1;
       }
    }
     if(item=="shirt"){
if(shirts>0){
         shirts=shirts-1;
       }
    }
    if(item=="pants"){

if(pants>0){
         pants=pants-1;
       }
    }

     if(item=="shorts"){

if(shorts>0){
         shorts=shorts-1;
       }
    }
     if(item=="other"){

if(other>0){
         other=other-1;
       }
    }

    setState(() {
      
    });
      
  }


void addcloths(item){



    if(item=="tshirt"){

         tshirts=tshirts+1;
       
    }
     if(item=="shirt"){

         shirts=shirts+1;
       
    }
    if(item=="pants"){


         pants=pants+1;
       
    }

     if(item=="shorts"){


         shorts=shorts+1;
       
    }
     if(item=="other"){


         other=other+1;
       
    }

setState(() {
  
});



}




@override
  void initState() {
    // TODO: implement initState
    super.initState();
getdata();

    
  }

  void getdata(){

supabase.from("orders").select("*").match({
  "bagid":widget.usercode,
 "order_time":widget.timestamp

}).execute().then((value) {

isloading=false;
  if(value.data.length>0){





   
//   print(value.data);
//   if(value.data[0]["day_take"]==DateFormat('EEEE').format(DateTime.now())){

setState(() {
issameday=true;

tshirts=value.data[0]["tshirts"];
shirts=value.data[0]["shirts"];
pants=value.data[0]["pants"];
shorts=value.data[0]["shorts"];
other=value.data[0]["other"];

userdata=value.data[0];






});



//   }
//   else{

// print("use cant give today");
// issameday=false;

//   }




  }
  else{
 setState(() {
      _userfound=false;
    });
    print("no user found");
  }




});


  }
}