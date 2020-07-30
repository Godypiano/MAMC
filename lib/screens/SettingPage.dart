import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:carousel_slider/carousel_slider.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';


class SettingPage extends StatelessWidget with NavigationStates {
  Future<String>createAlertDialog(BuildContext context){
    TextEditingController customController= TextEditingController();
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('Enter phone Number'),
        content: TextField(
          controller:customController ,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Submit'),
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
            },
          ),
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Settings',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(8.0),
              color: Colors.lightBlueAccent,
              child: ListTile(
                onTap: (){
                  //open edit profile
                },
                title: Text('Moruwasa Customer',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                trailing: Icon(Icons.edit,color: Colors.white,),
              ),
            ),
            const SizedBox(height: 10.0,),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.confirmation_number, color: Colors.blue,),
                    title: Text("Change PhoneNumber"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      createAlertDialog(context).then((onValue){
                        SnackBar mySnackBar= SnackBar(content: Text('Submitted successfull'),);
                        Scaffold.of(context).showSnackBar(mySnackBar);
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.language, color: Colors.blue,),
                    title: Text("Change Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      //open change language
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey.shade400,
                  ),
                   ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blue,),
                    title: Text("Change Location"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      //open change location
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            
          ],
        ),
      ),
    );
    }
}
