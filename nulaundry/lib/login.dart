import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nulaundry/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
final supabase = SupabaseClient('https://ayywccxhnqffassgwdxx.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF5eXdjY3hobnFmZmFzc2d3ZHh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAzOTQzMzcsImV4cCI6MTk2NTk3MDMzN30.wzWToML_bkULugTsTMRICE1RgWDh_Rm-lAuMD1UpOFc');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child:  Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/light-1.png')
	                        )
	                      ),
	                    ),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child:  Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/light-2.png')
	                        )
	                      ),
	                    )
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                 child:Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/clock.png')
	                        )
	                      ),
	                    )
	                  ),
	                  Positioned(
	                    child: Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	               Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey))
	                          ),
	                          child: TextField(
                              controller: _email,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email or Phone number",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
                              controller: _pass,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        )
	                      ],
	                    ),
	                  ),
	                  SizedBox(height: 30,),
	                Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
	                    child: Center(
	                      child: CupertinoButton(
                          
                          onPressed: (){
                            if(_email.text.isNotEmpty&&_pass.text.isNotEmpty){


supabase.from("users").select("*").match({

"email":_email.text,
"password":_pass.text

}).execute().then((value) async {
  
if(value.data.length>0){


  var prefs = await SharedPreferences.getInstance();
         prefs.setString("name", value.data[0]["name"]).then((ss) => {
  prefs.setInt("bagid", value.data[0]["bagno"]).then((valuse)=>{

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenu(bagcode: value.data[0]["bagno"] ,name:  value.data[0]["name"],)))

        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainMenu()))


  })
         });




}



});}

                          },
                          
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
	                    ),
	                  ),
	                  SizedBox(height: 70,),
	                   Text("Lu Laundry V.1.0.0", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
}