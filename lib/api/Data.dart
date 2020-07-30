import 'dart:convert';
import 'dart:io';

// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';
import 'package:device_preview/device_preview.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  Future<bool> login(String name, String meter_no) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
       await _prefs.setString('meter',meter_no);
    Map<String, dynamic> credentials = {
      'name': name,
      'meter_no': meter_no
      // "username": username,
      // "meterNo": meterno
    };

    final r = RetryOptions(maxAttempts: 3);
    print("in");
    http.Response response = await r.retry(
        () => http
               .post("http://desolate-shelf-21097.herokuapp.com/customer",
            //  .post("https://mamc-moruwasa.herokuapp.com/api/user/login",
                headers: {"content-type": "application/json"},
                body: json.encode(credentials))
            .timeout(Duration(seconds: 360)),
        retryIf: (e) => e is SocketException);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String,dynamic> map =json.decode( response.body);
        await   _prefs.setString("token", map["auth_token"]);
       print('out');
      return true;}
    else{
      return false;
    }
  }
}
