import 'package:demo_app/models/user.dart';
import 'package:demo_app/forms/login.dart';
import 'package:demo_app/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            return user.status ? Profile() : Login();
          })
        )
      )
    );
  }
}
