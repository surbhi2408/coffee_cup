import 'package:coffee_cup/models/cafe.dart';
import 'package:coffee_cup/screens/cafe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeList extends StatefulWidget {
  @override
  _CafeListState createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  @override
  Widget build(BuildContext context) {

    final cafes = Provider.of<List<Cafe>>(context) ?? [];

    // cafe.forEach((cafes) {
    //   print(cafes.name);
    //   print(cafes.sugars);
    //   print(cafes.strength);
    // });

    //print(cafe.documents);
    // for(var doc in cafe.documents){
    //   print(doc.data);
    // }

    return ListView.builder(
      itemCount: cafes.length,
      itemBuilder: (context, index) {
        return CafeTile(cafe: cafes[index]);
      },
    );
  }
}
