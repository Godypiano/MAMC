import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class SmsPage extends StatefulWidget {
  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(
        title:Text('Log complain'),
        ) ,
    body:Center(child:
        Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            child: Text('Send your complains concerning with bill issues only, Other suggestion or comment out of bill issues will not be concern via this platform',
            style:TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          child: Center(
            child:RaisedButton(
         child: Text('send complains'),
    onPressed: (){
      sendsms();
    },), 
          ),
        ),
      ],
       
    ),
    )
    );
  }
  sendsms(){
    String sms1 = "sms: 0714700861";
    launch(sms1);
  }
    
  
}