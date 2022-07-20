import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPaymentController extends GetxController {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardExpiryDate = TextEditingController();
  TextEditingController cardCVC = TextEditingController();

  List<String> listItemForUserPropertyType = [
    "Agricultural",
    "Residential",
    "Commercial",
    "Industrial",
    "Other"
  ];
  RxString userDateOfBirth = DateTime.now().toString().obs;
  String userPropertyType;

/*  void clearAllControllers(){
    cardNumber.clear();
    cardExpiryDate.clear();
    cardCVC.clear();
    userDateOfBirth.value = DateTime.now().toString();
    userPropertyType=null;
  }*/

  @override
  void onReady() {
    super.onReady();
  }
}
