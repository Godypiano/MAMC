import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class Consumption{
  final String consumption;

  Consumption({this.consumption});
  factory Consumption.fromJson(Map<String, dynamic> json) {
    return Consumption(
      consumption: json['consumption'],
    );
  }
}