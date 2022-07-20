import 'dart:convert';
import 'package:admin_taxolution/Models/payment_model.dart';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaymentController extends GetxController {
  TextEditingController paymentController = new TextEditingController();

  Map<String, dynamic> paymentIntentData;
  Rx<List<dynamic>> yearsList = Rx<List<dynamic>>();
  final firestore = FirebaseFirestore.instance;
  Rx<List<PaymentModel>> paymentList = Rx<List<PaymentModel>>();
  List<PaymentModel> get payment => paymentList.value;

  Future getPayments(id) async {
    await paymentList.bindStream(allPaymentsStream(id));
  }

  Stream<List<PaymentModel>> allPaymentsStream(id) {
    print("enter payments stream funtion");
    return firestore
        .collection('UserProfile')
        .doc(id)
        .collection('TaxPayment')
        .snapshots()
        .map((QuerySnapshot query) {
      List<PaymentModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(PaymentModel.fromSnapshot(element));
      });
      print(' payments lenght is ${retVal.length}');
      return retVal;
    });
  }

  List<String> listItemForUserFinancialYear = [
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
  ];

  var userFinancialYear;
}
