import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String message;
  String senderId;
  String id;
  Timestamp time;
  String userName;
  String userEmail;

  ChatModel(
      {this.senderId, this.message, this.id, this.userEmail, this.userName});

  ChatModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    message = snapshot.data()["message"] ?? "";
    senderId = snapshot.data()["senderId"] ?? "";
    time = snapshot.data()["dateTime"] ?? Timestamp.now();
    userEmail = snapshot.data()["senderEmail"] ?? "";
    userName = snapshot.data()["senderName"] ?? "";
  }
}
