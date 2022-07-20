import 'package:admin_taxolution/Models/tax_detection_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserTaxDeductionController extends GetxController {
  TextEditingController taxDeductionOnRegistration = TextEditingController();
  TextEditingController taxDeductionOnTransfer = TextEditingController();
  TextEditingController taxDeductionOnSale = TextEditingController();
  TextEditingController taxDeductionVehicleTax = TextEditingController();
  TextEditingController taxDeductionCashWithdrawals = TextEditingController();
  TextEditingController taxDeductionUtilityTax = TextEditingController();
  TextEditingController taxDeductionBankingTransection =
      TextEditingController();
  TextEditingController taxDeductionRegistration = TextEditingController();
  TextEditingController taxDeductionOnTelephone = TextEditingController();
  TextEditingController taxDeductionTelephoneNumber = TextEditingController();
  TextEditingController taxDeductionOnTelephoneConsumerNumber =
      TextEditingController();
  TextEditingController taxDeductionOnCellPhone = TextEditingController();
  TextEditingController taxDeductionCellPhoneNumber = TextEditingController();
  TextEditingController taxDeductionOnCellPhoneConsumerNumber =
      TextEditingController();
  TextEditingController taxDeductionOnInternet = TextEditingController();
  TextEditingController taxDeductionOnPropertySale = TextEditingController();
  TextEditingController taxDeductionCharityAmount = TextEditingController();
  TextEditingController taxDeductionUnderCharityAmount =
      TextEditingController();
  TextEditingController taxDeductionAnyInterestAmount = TextEditingController();
  TextEditingController taxDeductionPayAnyTution = TextEditingController();
  TextEditingController taxDeductionOnPropertyPurchased =
      TextEditingController();
  TextEditingController taxDeductionOnInternetConsumerNumber =
      TextEditingController();
  TextEditingController taxDeductionOnInternetTaxDeducted =
      TextEditingController();
  TextEditingController taxDeductionPropertyTransactionPurchased =
      TextEditingController();
  TextEditingController taxDeductionPropertyTransactionSale =
      TextEditingController();
  TextEditingController taxDeductionTaxRefundFromPriorYears =
      TextEditingController();
  TextEditingController taxDeductionWithdrawalOfFundsFromVoluntary =
      TextEditingController();
  TextEditingController taxDeductionFunctionAndGathering =
      TextEditingController();
  TextEditingController taxDeductionOnLocalAirTickets = TextEditingController();
  TextEditingController taxDeductionOnAirInternationalTickets =
      TextEditingController();
  TextEditingController taxDeductionOnEducationalInstitutionFee =
      TextEditingController();
  RxInt noOfAnyOtherDeduction = 1.obs;
  RxBool noOfDetcutionItems = false.obs;
  DateTime selectedDate;
  TextEditingController yearController = TextEditingController();
  Rx<List<dynamic>> taxDetectionYearsList = Rx<List<dynamic>>();
  Rx<List<TaxDetectionModel>> list = Rx<List<TaxDetectionModel>>([]);
  String dropDownValueLiability;
  String detectionId;
  Rx<TaxDetectionModel> value = Rx<TaxDetectionModel>();

  String investmentYesNo;
  List<String> itemListInvestmentYesNo = [
    "Yes",
    "No",
    "Other",
  ];
  String anyDonation;
  List<String> itemListAnyDonationYesNo = [
    "Yes",
    "No",
    "Other",
  ];

  String approvedCharityYesNo;
  List<String> itemListApprovedCharityYesNo = [
    "Yes",
    "No",
    "Other",
  ];

  String underCharityYesNo;
  List<String> itemListUnderCharityYesNo = [
    "Yes",
    "No",
    "Other",
  ];

  String anyInterestYesNo;
  List<String> itemListAnyInterestYesNo = [
    "Yes",
    "No",
    "Other",
  ];

  String payAnyTutionYesNo;
  List<String> itemListPayAnyTutionYesNo = [
    "Yes",
    "No",
    "Other",
  ];

  String listOfOrganization;

  bool isPressed = false;
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  List<OtherTaxDetectionModel> customTextEditing = [];
  Rx<List<TaxDetectionModel>> taxDetectionList = Rx<List<TaxDetectionModel>>();
  List<TaxDetectionModel> get taxDetection => taxDetectionList.value;

  Rx<List<OtherTaxDetectionModel>> otherTaxDetectionList =
      Rx<List<OtherTaxDetectionModel>>();
  RxBool isClick = false.obs;
  List<OtherTaxDetectionModel> get otherTaxDetection =>
      otherTaxDetectionList.value;

  Future getTaxDetection(id) async {
    list = Rx<List<TaxDetectionModel>>([]);

    await taxDetectionList.bindStream(allTaxDetectionStream(id));
  }

  Rx<List<TaxDetectionModel>> reqTaxDetectionList =
      Rx<List<TaxDetectionModel>>();
  List<TaxDetectionModel> get reqTaxDetection => reqTaxDetectionList.value;
  Future getRequiredTaxDetection(id, value) async {
    // list = Rx<List<TaxDetectionModel>>([]);

    await reqTaxDetectionList.bindStream(requiredTaxDetStream(id, value));
  }

  Future getOtherTaxDectection(id, otherId) async {
    await otherTaxDetectionList
        .bindStream(otherTaxDetectionStream(id, otherId));
  }

  Stream<List<TaxDetectionModel>> allTaxDetectionStream(id) {
    print("enter tax detection stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('TaxDetection')
        .snapshots()
        .map((QuerySnapshot query) {
      List<TaxDetectionModel> retVal = List();
      query.docs.forEach((element) {
        list.value.add(TaxDetectionModel.fromSnapshot(element));
        retVal.add(TaxDetectionModel.fromSnapshot(element));
      });
      value.value = list.value[0];
      print(' tax detection lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<OtherTaxDetectionModel>> otherTaxDetectionStream(id, otherId) {
    print("other tax detection stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('TaxDetection')
        .doc(otherId)
        .collection('otherSource')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OtherTaxDetectionModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(OtherTaxDetectionModel.fromSnapshot(element));
      });
      print('other tax detection lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<TaxDetectionModel>> requiredTaxDetStream(id, value) {
    print("enter require tax dec stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('TaxDetection')
        .where("year", isEqualTo: value)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TaxDetectionModel> retVal = List();
      query.docs.forEach((element) {
        print("year is${element['year']}");

        retVal.add(TaxDetectionModel.fromSnapshot(element));
      });
      print('require expense lenght is ${retVal.length}');
      return retVal;
    });
  }

  //customTextEditing.map((e) => e.toJson()).toList();

  @override
  void onReady() {
    super.onReady();
  }

  final firebaseFirestore = FirebaseFirestore.instance;

  selectYear(BuildContext context) async {
    DateTime newDateTime = await showRoundedDatePicker(
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
      height: 200,
      context: context,
      initialDate: selectedDate != null ? selectedDate : DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      theme: ThemeData(primarySwatch: Colors.blue),
    );

    if (newDateTime != null) {
      selectedDate = newDateTime;

      yearController
        ..text = DateFormat.y().format(selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: yearController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
