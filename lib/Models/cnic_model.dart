import 'package:cloud_firestore/cloud_firestore.dart';

class CNICModel{
  String frontSide;
  String backSide;
  CNICModel({this.backSide,this.frontSide});
  CNICModel.fromSnapshot(DocumentSnapshot snapshot){
    frontSide=snapshot.data()['image-back']??"";
    backSide=snapshot.data()['image-front']??"";
  }
}