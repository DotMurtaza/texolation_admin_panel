import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  double amount;
  int year;
  Timestamp date;
  PaymentModel({this.amount, this.year});
  PaymentModel.fromSnapshot(DocumentSnapshot snapshot) {
    amount = snapshot.data()['amount'] ?? 0.0;
    year = snapshot.data()['year'] ?? 0;
    date = snapshot.data()['date'] ?? Timestamp.now();
  }
}
