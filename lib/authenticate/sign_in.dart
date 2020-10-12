import 'package:coffee_cup/services/auth.dart';
import 'package:coffee_cup/shared/constants.dart';
import 'package:coffee_cup/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Coffee-Cup"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
            ),
            label: Text("Register"),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Email',
                  icon: Icon(Icons.email),
                ),
                validator: (val) => val.isEmpty ? "Enter an Email" : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (val) => val.length < 6 ? "Enter valid Password with at least 6 character" : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Could not sign in with those credentials';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),

        // sign in anonymously

        // child: RaisedButton(
        //   child: Text("sign in anon"),
        //   onPressed: () async{
        //     dynamic result = await _auth.signInAnon();
        //     if(result == null){
        //       print("error signing in");
        //     }
        //     else{
        //       print("signed in");
        //       print(result.uid);
        //     }
        //   },
        // ),
      ),
    );
  }
}
