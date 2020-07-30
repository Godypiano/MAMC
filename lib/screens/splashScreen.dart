
import 'package:flutter/material.dart';

import 'package:mamc/screens/loginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 50,
                        child: Icon(
                          Icons.branding_watermark,
                          color: Colors.blueGrey,
                          size: 50,
                          ),
                      ),
                      Padding(padding:EdgeInsets.only(top: 10.0) ,),
                      Text("MORUWASA",style: TextStyle(color: Colors.white,fontSize: 40.0,
                      fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding( 
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Material(
                      elevation: 5.0,
                     borderRadius: BorderRadius.circular(30.0),
                    child:MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: (){
                        navigateToLoginPage(context);
                      },
                      child: Text("Get Started",
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 22,
                       color: Colors.blueAccent, fontWeight: FontWeight.bold),
                       ),

                    ),
                    ),
                    SizedBox(height: 4,),
                      Text("Customer Bill(s) and water Usage\n Both On Hands", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        //fontWeight:, 
                      ),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  }
  Future navigateToLoginPage(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()) );
  }
