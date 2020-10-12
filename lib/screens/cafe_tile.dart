import 'package:flutter/material.dart';
import 'package:coffee_cup/models/cafe.dart';

class CafeTile extends StatelessWidget {

  final Cafe cafe;
  CafeTile({this.cafe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[cafe.strength],
          ),
          title: Text(cafe.name),
          subtitle: Text('Takes ${cafe.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
