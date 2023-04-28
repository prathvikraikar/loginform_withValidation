import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController a = new TextEditingController();
  TextEditingController b = new TextEditingController();
  String s = "";
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('first project'),
        ),
        body: Container(
            child: Form(
          key: formkey,
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: a,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'username',
                    hintText: 'enter mail id',
                    icon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'usernamae cant be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: b,
                keyboardType: TextInputType.phone,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'phone',
                    hintText: 'Enter phone number',
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password cant be null';
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    var email = a.text;
                    var phone = b.text.toString();
                    setState(() {
                      s = "username is $email \n passwod is $phone";
                    });
                  }
                },
                child: Text('Login'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(s),
            )
          ]),
        )),
      ),
    );
  }
}
