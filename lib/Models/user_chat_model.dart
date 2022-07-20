import 'package:cloud_firestore/cloud_firestore.dart';

class UserchatModel {
  String sellerName;
  String imageUrl;
  String id;
  Timestamp time;
  String email;

  UserchatModel({this.imageUrl, this.sellerName, this.id});

  UserchatModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    sellerName = snapshot.data()["senderName"] ?? "";
    imageUrl = snapshot.data()["imageUrl"] ?? "";
    time = snapshot.data()["dateTime"] ?? Timestamp.now();
    email = snapshot.data()["senderEmail"] ?? "";
    print('User id is $id');
  }
}
