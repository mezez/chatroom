import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, //children to take min size the need
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      TextFormField(
                        obscureText: true, //hide text for password
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      RaisedButton(
                        child: Text('Login'),
                        onPressed: () {},
                      ),
                      FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          child: Text('Create new account'))
                    ],
                  ),
                ),
              ),
            )));
  }
}
