import 'dart:convert';

import 'package:demo_app/models/converter.dart';
import 'package:demo_app/models/user.dart';
import 'package:demo_app/widgets/login.dart';
import 'package:demo_app/widgets/converter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConverterModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: Text('Programación Móvil 2020'),
              ),
              body: Center(
                  child: Consumer<UserModel>(builder: (context, user, child) {
                return user.status ? Converter() : Login();
              })))),
    );
  }
}
