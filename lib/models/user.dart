import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//enum Status { Authenticated, Unauthenticated }

class UserModel extends ChangeNotifier {
  bool status = false;
  String user;
  String password;

  Future<void> signIn(String email, String password) async {
    if (this.user == email && this.password == password) {
      this.status = true;
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('status', this.status);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  Future<void> verifyStatus() async {
    final prefs = await SharedPreferences.getInstance();
    this.status = prefs.getBool('status') ?? false;
    notifyListeners();
  }

  void signUp(String email, String password) {
    this.user = email;
    this.password = password;
    notifyListeners();
  }

  Future<void> signOut() async {
    this.user = "";
    this.password = "";
    this.status = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('status', this.status);
    notifyListeners();
  }
}
