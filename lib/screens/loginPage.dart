import 'package:flutter/material.dart';
import 'package:mamc/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mamc/api/Data.dart';
import 'dart:async';
import 'package:mamc/sidebar/sidebar_layout.dart';

 class LoginPage extends StatefulWidget with NavigationStates {

     LoginPage({Key key, this.title}) : super(key: key);
      
      final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
      TextEditingController _name =new TextEditingController();
      TextEditingController _meter_no =new TextEditingController();
      final _key = new GlobalKey<FormState>();
double index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
       body: Center(
            child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                   key: _key,
                  child: Stack(
                    children: <Widget>[
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         SizedBox(
                           height: MediaQuery.of(context).size.height/3,
                         ),
                         Row(
                           children: <Widget>[
                             SizedBox(width: MediaQuery.of(context).size.width/3,),
                             Opacity(
                       child: CircularProgressIndicator(
                         semanticsLabel: "loading ....",
                backgroundColor: Colors.cyan,
                  strokeWidth: 5,
              ), 
              opacity: index,
                     )
                           ],
                         )
                       ],
                     ),
                      Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    TextFormField(
                      validator: (value){
                        if(value == null || value.length == 0)
                       {
                         return "Invalid username";
                       }
                      return null;
                      },
          controller: _name,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "User name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(28.0))),
        ),
                    SizedBox(height: 25.0),
                   TextFormField(
                     validator: (value){
                      if(value.length < 8 || value.length > 10){
                        return "Incorrect meterno";
                      }
                      return null;
                     },
                onChanged: (value){
                  if(value.length ==8){
              print("valid character");
                  }else{
                 print("err");
              }
              },
           controller: _meter_no,
          obscureText: true,
          style: style,
          decoration: InputDecoration(
            
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "meter number",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(28.0))),
        ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
             minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () async{
              print('correct');
              setState(() {
               index = 1; 
              });
                if(_key.currentState.validate())
                {
                  print("we are in");
                  Data data = new Data();
                  SharedPreferences _prefs = await SharedPreferences.getInstance();
                    
              // bool success =  await data.login(_username.text.toString(), _meterno.text.toString());
              bool success =  await data.login(_name.text.toString(), _meter_no.text.toString());
              if(success){
                print('success');
              //   if(_prefs.getString("token").length != 0)
              // {
              //   print(_prefs.getString("token").toString() + "data");
              //   setState(() {
              //    index = 0; 
              //   });
              //   navigateToNextPage(context); 
              // }
                   navigateToNextPage(context);   
                }else{
                  print("hello");
                }
              }
              else{
                return CircularProgressIndicator();
              }
            
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          
        ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                )
                    ],
                  ),
                )
              ),
            ),
            )
          ),
    );
  }
}
Future navigateToNextPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>SideBarLayout()));
}