import 'package:admin_taxolution/Models/income_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInformationController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userAlternativePhoneNumber = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  TextEditingController userCurrentAddress = TextEditingController();
  TextEditingController userForeignAddress = TextEditingController();
  TextEditingController userPermanentAddress = TextEditingController();
  TextEditingController userNTNPassword = TextEditingController();
  TextEditingController userBusinessAddress = TextEditingController();
  final firebaseFirestore = FirebaseFirestore.instance;

  List<String> listItemForUserGender = ["Male", "Female", "Other"];
  List<OtherIncomesModel> otherModelList = [];

  RxString userDateOfBirth = DateTime.now().toString().obs;
  RxString userTaxFinancialYear = DateTime.now().toString().obs;
  RxString userCurrentAddressCountryValue = "".obs;
  RxBool userResidentialStatusCheck = false.obs;
  RxString userCurrentAddressStateValue = "".obs;
  RxString userCurrentAddressCityValue = "".obs;
  RxString userForeignAddressCountryValue = "".obs;
  RxString userForeignAddressStateValue = "".obs;
  RxString userForeignAddressCityValue = "".obs;
  RxString userPermanentAddressCountryValue = "".obs;
  RxString userPermanentAddressStateValue = "".obs;
  RxString userPermanentAddressCityValue = "".obs;
  RxString userBusinessAddressCountryValue = "".obs;
  RxString userBusinessAddressStateValue = "".obs;
  RxString userBusinessAddressCityValue = "".obs;
  Country userCountryName;
  String userGender;
  String userProperType;
  String userSelectedPropertyType;
  String userNTNRegistration;
  String userNTNRegistrationPasswordNotRemember;
  String userResidentialStatus;
  String userSourceIncome;
  String userFinancialYear;

  @override
  void onReady() {
    super.onReady();
  }
}
