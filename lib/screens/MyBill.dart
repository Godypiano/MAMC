import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Bill_model.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../controller/Network_asset.dart';

class Bill extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBill(),
    );
  }
}
class MyBill extends StatefulWidget {
    MyBill({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyBillState createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> {
  Map<String, double> data = {};
  bool _loadChart = false;
  double sum = 1663;


  Material MyItems (String heading, int color,){
    return Material(
      color: Colors.grey,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(heading, 
                  style:TextStyle(
                    color: new Color(color),
                    fontSize: 24.0,
                  ) ,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   _loadChart ? PieChart(
                dataMap: data,
                colorList:
                    _colors, // if not declared, random colors will be chosen
                animationDuration: Duration(milliseconds: 1500),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width /
                    2.7, //determines the size of the chart
                showChartValuesInPercentage: false,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                showLegends: true,
                legendPosition:
                    LegendPosition.right, //can be changed to top, left, bottom
                decimalPlaces: 1,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.ring, //can be changed to ChartType.ring
              ) : SizedBox(
                height: 150,
              ),
            
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Click to Show Usage', style: TextStyle(
                color: Colors.white
              ),),
              onPressed: () {
                setState(() {
                  _loadChart = true;
                });
              },

            ),
                ]  
              ),
            ],
          ),
        ),
      ),
    );
  }
  //second block which will display a bill per day
  Material MyItems1(){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.lightBlue,
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        children: <Widget>[
          Text("The above usages are taken in segments each in duration of 6hr to complete a day of 24Hr",
          style:TextStyle(
            color: Colors.black,
            fontSize: 14,
          ) ,
          ),
        SizedBox(
          height: 6,
        ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Today total bill: ', style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              Card(
                
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.width/8,
                  color: Colors.white,
                  child: Padding(padding:EdgeInsets.only(top: 15,left: 26) ,
                  child: Text(sum.toString()+"Tshs"),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //third block for dipicting monthly bill
  Material MyItems2(){
     return Material(
       color: Colors.white,
       elevation: 14.0,
      shadowColor: Colors.lightBlue,
      borderRadius: BorderRadius.circular(10.0),
     );
   }
   Future<List<dynamic>> futureConsumption;
   @override
 void initState(){
   super.initState();
   
   futureConsumption = fetchConsumption().then((onValue){

  

print(onValue);
   mydata(onValue);
    });
   

     print("values");
   
   

  
    
 }

 void mydata(List onValue) async{
 SharedPreferences _prefs = await SharedPreferences.getInstance();
    
for(int i =0;i < onValue.length ; i++)
{

  data.putIfAbsent("usage $i", ()=> double.parse( onValue[i]));

}
      
  setState(() {
    sum = sum*(_prefs.getDouble("sum"));
  });
 }
   List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch consumption',
       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('',
           style:TextStyle(
             color: Colors.white,
           ) ,
           ),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0 ),
          children: <Widget>[
            MyItems('Water usage', 0xffed622b, ),
            MyItems1(),
            MyItems2(),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 300.0), 
            StaggeredTile.extent(2, 100.0),
            StaggeredTile.extent(2, 100.0), 
          ],
          
        ),
        
         ),
    );
  }

}
        
         
      