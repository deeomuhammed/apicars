// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

class Users {
  Users({
    this.data,
  });

  List<User>? data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );
}

class User {
  User({
    this.car_id,
    this.category_id,
    this.car_name,
    this.car_hp,
    this.car_transmission,
    this.car_suspension,
    this.car_wheelType,
    this.car_headlightType,
  });

  var car_id,
      category_id,
      car_name,
      car_hp,
      car_transmission,
      car_suspension,
      car_wheelType,
      car_headlightType;

  factory User.fromJson(Map<String, dynamic> item) => User(
        car_headlightType: item['car_headlightType'],
        car_hp: item['car_hp'],
        car_id: item['car_id'],
        car_name: item['car_name'],
        car_suspension: item['car_suspension'],
        car_transmission: item['car_transmission'],
        car_wheelType: item['car_wheelType'],
        category_id: item['category_id'],
      );
}

// To parse this JSON data, do
//
//     final cars = carsFromJson(jsonString);

Cars carsFromJson(String str) => Cars.fromJson(json.decode(str));

class Cars {
  Cars({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.categoryId,
    required this.categoryName,
  });

  int categoryId;
  String categoryName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );
}
