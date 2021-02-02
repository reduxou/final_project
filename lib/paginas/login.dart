import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  bool validator() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 70, left: 40, right: 40),
            child: Form(
                key: formKey,
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3.0)),
                          labelText: 'Insira seu e-mail',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(color: Colors.black),
                        validator: (value) => value.isEmpty
                            ? 'O campo email não pode ficar vazio.'
                            : null),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 3.0)),
                            labelText: 'Insira sua senha',
                            labelStyle: TextStyle(color: Colors.black)),
                        style: TextStyle(color: Colors.black),
                        validator: (value) => value.isEmpty
                            ? 'O campo senha não pode ficar vazio.'
                            : null),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox.expand(
                            child: FlatButton(
                                onPressed: () {
                                  validator();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ENTRAR',
                                      style: TextStyle(
                                          fontSize: 21, color: Colors.white),
                                    )
                                  ],
                                )))),
                  ],
                ))));
  }
}
