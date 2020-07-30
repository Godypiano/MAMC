import 'package:http/http.dart' as http;
import 'package:mamc/model/Bill_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<List<dynamic>> fetchConsumption() async{

    List data =  [];
    
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    
    String  meter =  _prefs.getString('meter');
  final response = 

   
  await http.get('http://desolate-shelf-21097.herokuapp.com/consumption/'+meter);


  if(response.statusCode ==200){

    final List<dynamic> responseData = json.decode(response.body)["data"];
    print("data");
    
     for(int i = 0 ;i < responseData.length ; i++)

  {
    
       data.add(responseData[i]["consumption"]);
  }

    //print(json.decode(response.body)["data"].length);
// Consumption.fromJson(json.decode(response.body));
// print(data);

sum(data);
 return data;
  }else{
    throw Exception('Failed to load Consumption');
  }
}

 sum(List d) async
{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  double sum = 0;
  for(int i =0;i < d.length ; i++)
{
   sum = sum + double.parse(d[i]);
}



 _prefs.setDouble("sum", sum);
}