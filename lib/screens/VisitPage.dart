import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:mamc/screens/SmsPage.dart';

class VisitPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    // ThemeData(
    //   brightness: Brightness.light,
    //   primaryColor: Colors.cyan,
    // ),
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/3,
              fit: BoxFit.cover,
              image: AssetImage('assets/jengo.jpg'),),
            Positioned(
              bottom: -30.0,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.green,
                 backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ListTile(
          title: Center(child:
            Text('Thank you For choosing Us'),
            ),
           subtitle: Center(child:
             InkWell(
            child: Text("https://www.moruwasa.go.tz/", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
  onTap: () {
    launch('https://www.moruwasa.go.tz/');
  }
)
            //  child:
            //  Text('https://www.moruwasa.go.tz/'),
             ),
          
        ),
        FlatButton.icon(
          onPressed: (){
            navigateToSmsPage(context);
          },
          icon: Icon(Icons.sms,color: Colors.white,),
        label: Text('Complain/suggestions',
        style: TextStyle(color: Colors.white),
        ),
        color:Colors.blue ,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)) ,
        ),
        ListTile(
          title: Text('About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('MORUWASA was established for supply of reliable, affordable and clean water and provision of sewerage services in Morogoro Municipality and other designated operational areas. Morogoro Municipality is situated about 200 km. West of Dar es Salaam and it is the eighth largest town in Tanzani',
          style:TextStyle(color: Colors.black) ,),

        ),
      ],
    );
  }
}
Future navigateToSmsPage(context) async{
  Navigator.push(context,MaterialPageRoute(builder: (context)=>SmsPage()));
}