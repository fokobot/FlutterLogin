import 'package:demo_app/models/user.dart';
import 'package:demo_app/screens/myhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => UserModel(), child: MyHome()));
