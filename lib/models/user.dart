import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//enum Status { Authenticated, Unauthenticated }

class UserModel extends ChangeNotifier {
  final String token;
  final String username;
  final String name;
  bool status = false;

  UserModel({this.token, this.username, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      username: json['username'],
      name: json['name'],
    );
  }
  Future<UserModel> signIn(String email, String password) async {
    final http.Response response = await http.post(
      'https://movil-api.herokuapp.com/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );

    print('${response.body}');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.body}');
      notifyListeners();
      return UserModel.fromJson(json.decode(response.body));
    } else {
      print("signup failed");
      print('${response.body}');
      throw Exception(response.body);
    }
  }
  /*Future<void> signIn(String email, String password) async {
    if (this.username == email) {
      this.status = true;
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('status', this.status);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }*/

  Future<void> verifyStatus() async {
    final prefs = await SharedPreferences.getInstance();
    this.status = prefs.getBool('status') ?? false;
    notifyListeners();
  }

  /*void signUp(String email, String password) {
    this.user = email;
    this.password = password;
    notifyListeners();
  }*/

  Future<UserModel> signUp(
      String email, String password, String username, String name) async {
    final http.Response response = await http.post(
      'https://movil-api.herokuapp.com/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'username': username,
        'name': name
      }),
    );

    print('${response.body}');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.body}');
      notifyListeners();
      return UserModel.fromJson(json.decode(response.body));
    } else {
      print("signup failed");
      print('${response.body}');
      throw Exception(response.body);
    }
  }
  void setLoggedIn(String username){
    this.status = true;
    notifyListeners();
  }
  Future<void> signOut() async {
    /*this.user = "";
    this.password = "";
    this.status = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('status', this.status);*/
    notifyListeners();
  }
}
