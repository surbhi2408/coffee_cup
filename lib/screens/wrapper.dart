import 'package:coffee_cup/authenticate/authenticate.dart';
import 'package:coffee_cup/models/user.dart';
import 'package:coffee_cup/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //print(user);
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

    // returning either home or authenticate widget
    return Authenticate();
  }
}
