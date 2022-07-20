import 'package:admin_taxolution/Models/income_info_model.dart';
import 'package:admin_taxolution/Models/textEditingController/textEditingController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final firebaseFirestore = FirebaseFirestore.instance;

class UserIncomeInformationController extends GetxController {
  RxString selectedValue = "".obs;
  RxString incomeId = ''.obs;
  String valueDropDown;
  RxBool isClick = false.obs;
  TextEditingController yearController = TextEditingController();
  TextEditingController annualSalary = TextEditingController();
  TextEditingController taxPaidAnnualSalary = TextEditingController();
  TextEditingController taxDeduction = TextEditingController();
  TextEditingController propertyIncome = TextEditingController();
  TextEditingController propertyIncomeTaxPaid = TextEditingController();
  TextEditingController businessIncome = TextEditingController();
  TextEditingController taxPaidBusinessIncome = TextEditingController();
  TextEditingController foreignIncome = TextEditingController();
  TextEditingController foreignIncomeRemittance = TextEditingController();
  TextEditingController taxPaidForeignIncome = TextEditingController();
  TextEditingController agriculturalIncome = TextEditingController();
  TextEditingController taxPaidAgriculturalIncome = TextEditingController();
  TextEditingController capitalIncomeProperty = TextEditingController();
  TextEditingController bankProfit = TextEditingController();
  TextEditingController taxPaidBankProfit = TextEditingController();
  TextEditingController taxOnDividend = TextEditingController();
  TextEditingController gift = TextEditingController();
  TextEditingController inheritance = TextEditingController();
  TextEditingController foreignRemittance = TextEditingController();
  TextEditingController contributionFamilyAmount = TextEditingController();
  TextEditingController pension = TextEditingController();
  TextEditingController purchaseValue = TextEditingController();
  TextEditingController saleValue = TextEditingController();
  TextEditingController holdingPeriodPurchaseDate = TextEditingController();
  TextEditingController holdingPeriodSaleDate = TextEditingController();
  TextEditingController capitalGain = TextEditingController();
  TextEditingController taxLiability = TextEditingController();
  TextEditingController taxDeducted = TextEditingController();
  TextEditingController mutualFunds = TextEditingController();
  TextEditingController plotAddress = TextEditingController();
  TextEditingController plotSize = TextEditingController();
  TextEditingController incomeFromAnyOtherSource = TextEditingController();
  TextEditingController descriptionIncomeFromAnyOtherSource =
      TextEditingController();
  Rx<List<dynamic>> incomeInfoYearsList = Rx<List<dynamic>>();

  RxInt noOfAnyOtherIncome = 0.obs;
  DateTime selectedDate;
  RxList otherSourceList = [].obs;
  bool isPressed = false;
  List<OtherIncomesModel> otherIncomeList = [];

  String userDividend;
  List<String> listItemForDividend = [
    "Received from power company taxed at 7.5% ",
    "Received from other company & stock funds taxed at 15%",
    "Dividend from company where no tax payable by such company taxed at 25%"
  ];
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  RxBool noOfOtherSourceItems = false.obs;
  List<MyTextEditingModel> customTextEditing = [];
  addCustomTextEditingControllerList() {
    //customTextEditing.map((e) => e.toJson()).toList();
    noOfAnyOtherIncome.value++;
    customTextEditing.add(MyTextEditingModel(
        otherSourceIncome: a, otherSourceDisc: b, otherSourceTax: c));
  }

  Rx<List<IncomeInfoModel>> incomeInfoList = Rx<List<IncomeInfoModel>>();
  List<IncomeInfoModel> get incomeInfo => incomeInfoList.value;

  Rx<List<OtherIncomesModel>> otherIncomeInfoList =
      Rx<List<OtherIncomesModel>>();
  List<OtherIncomesModel> get otherIncomeInfo => otherIncomeInfoList.value;
  //get required data
  Rx<List<IncomeInfoModel>> requireIncomeInfoList = Rx<List<IncomeInfoModel>>();
  List<IncomeInfoModel> get requireIncomeInfo => requireIncomeInfoList.value;
  Rx<IncomeInfoModel> value = Rx<IncomeInfoModel>();
  Rx<List<OtherIncomesModel>> requireOtherIncomeInfoList =
      Rx<List<OtherIncomesModel>>();
  List<OtherIncomesModel> get requireOtherIncomeInfo =>
      requireOtherIncomeInfoList.value;
  Rx<List<IncomeInfoModel>> list = Rx<List<IncomeInfoModel>>([]);
  Future getIncome(id) async {
    list = Rx<List<IncomeInfoModel>>([]);
    // idList = Rx<List<String>>([]);
    //  getsubCollection(id);
    await incomeInfoList.bindStream(allIncomeStream(id));
  }

  Future getOtherIncome(id, otherId) async {
    await otherIncomeInfoList.bindStream(allOtherIncomes(id, otherId));
  }

  Future getRequireotherIncome(id, id2) async {
    await requireOtherIncomeInfoList.bindStream(requireOtherIncomes(id, id2));
  }

  Future getRequiredIncome(id, value) async {
    list = Rx<List<IncomeInfoModel>>([]);
    await requireIncomeInfoList.bindStream(requiredIncomeStream(id, value));
  }

  Stream<List<IncomeInfoModel>> allIncomeStream(id) {
    print("enter income stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('IncomeInformation')
        .snapshots()
        .map((QuerySnapshot query) {
      List<IncomeInfoModel> retVal = List();
      query.docs.forEach((element) {
        debugPrint("year is${element['year']}");
        print("before");
        list.value.add(IncomeInfoModel.fromSnapshot(element));
        print("after");

        //requireIncomeInfoList.value[0].year = element['year'];
        retVal.add(IncomeInfoModel.fromSnapshot(element));
        print("added");
      });
      print("hihii");
      value.value = list.value[0];
      print("Income :${value.value.year}");

      // value.value = list.value[0];
      print(' income info lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<IncomeInfoModel>> requiredIncomeStream(id, value) {
    print("enter income stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('IncomeInformation')
        .where('year', isEqualTo: value)
        .snapshots()
        .map((QuerySnapshot query) {
      List<IncomeInfoModel> retVal = List();
      query.docs.forEach((element) {
        print("year is${element['year']}");
        list.value.add(IncomeInfoModel.fromSnapshot(element));

        retVal.add(IncomeInfoModel.fromSnapshot(element));
      });
      value = list.value[0];
      print(' income info lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<OtherIncomesModel>> allOtherIncomes(id, otherId) {
    print("enter expense stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('IncomeInformation')
        .doc(otherId)
        .collection('otherSource')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OtherIncomesModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(OtherIncomesModel.fromSnapshot(element));
      });
      print('other  income info lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<OtherIncomesModel>> requireOtherIncomes(id, id2) {
    print("enter expense stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('IncomeInformation')
        .doc(id2)
        .collection('otherSource')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OtherIncomesModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(OtherIncomesModel.fromSnapshot(element));
      });
      print('require other  income info lenght is ${retVal.length}');
      return retVal;
    });
  }

  // AuthScreenValidationController authScreenValidationController =
  //     Get.put(AuthScreenValidationController());

  @override
  void onReady() {
    super.onReady();
  }

  selectYear(BuildContext context) async {
    DateTime newDateTime = await showRoundedDatePicker(
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
      height: 200,
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
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
