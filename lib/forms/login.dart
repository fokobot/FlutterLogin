import 'dart:developer';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:demo_app/forms/register.dart';
import 'package:demo_app/models/user.dart';
import 'package:demo_app/widgets/customdialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({@required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class Login extends StatelessWidget {

  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final controllerEmail = new TextEditingController();
  final controllerPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      validator: (value) {
        if (value.isEmpty || !EmailValidator.validate(value)) {
          return 'Por favor escriba un email valido';
        }
        return null;
      },
      obscureText: false,
      style: style,
      controller: controllerEmail,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor digite su contraseña';
        }
        return null;
      },
      obscureText: true,
      style: style,
      controller: controllerPassword,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Contraseña",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Provider.of<UserModel>(context, listen: false)
                .signIn(
                    controllerEmail.value.text, controllerPassword.value.text)
                .then((user) {
              Provider.of<UserModel>(context, listen: false)
                  .setLoggedIn(user.username);
              CustomDialog(
                title: "Exito!",
                description: "Done",
                buttonText: "Okay",
              ); //_buildDialog(context, "Exito!", "Done");
            }).catchError((error) {
              developer.log('Error de Login', name: 'DEBUG');
              final failedLogin = SnackBar(
                content: Text('Error Login'),
                action: SnackBarAction(
                  label: 'Cerrar',
                  onPressed: () {
                    print("Cerrar SnackBar");
                    // Some code to undo the change.
                  },
                ),
              );
              // Mostrar SnackBar
              Scaffold.of(context).showSnackBar(failedLogin);
            }).timeout(Duration(seconds: 10), onTimeout: () {
              CustomDialog(
                title: "Error",
                description: "Timeout > 10secs",
                buttonText: "Okay",
              ); //_buildDialog(context, "Error", "Timeout > 10secs");
            });
          }
        },
        child: Text("Iniciar Sesión",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return StatefulWrapper(
      onInit: () =>
          Provider.of<UserModel>(context, listen: false).verifyStatus(),
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        child: Text("Registrarse",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register()),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
