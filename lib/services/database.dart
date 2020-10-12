import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_cup/models/cafe.dart';
import 'package:coffee_cup/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference coffeeCollection = Firestore.instance.collection('coffee');

  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // cafe list from snapshots
  List<Cafe> _cafeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Cafe(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  // userdata from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  // get cafe stream
  Stream<List<Cafe>> get cafe{
    return coffeeCollection.snapshots()
        .map(_cafeListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData{
    return coffeeCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
}