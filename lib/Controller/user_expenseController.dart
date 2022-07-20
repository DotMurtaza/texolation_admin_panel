import 'package:admin_taxolution/Models/expense_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserExpenseController extends GetxController {
  TextEditingController annualExpense = new TextEditingController();
  TextEditingController detailAnnualExpense = new TextEditingController();
  TextEditingController rentExpense = new TextEditingController();
  TextEditingController cessExpense = new TextEditingController();
  TextEditingController maintenanceExpense = new TextEditingController();
  TextEditingController travellingExpense = new TextEditingController();
  TextEditingController electricityExpense = new TextEditingController();
  TextEditingController waterExpense = new TextEditingController();
  TextEditingController gasExpense = new TextEditingController();
  TextEditingController telephoneExpense = new TextEditingController();
  TextEditingController insuranceExpense = new TextEditingController();
  TextEditingController medicalExpense = new TextEditingController();
  TextEditingController educationalExpense = new TextEditingController();
  TextEditingController clubExpense = new TextEditingController();
  TextEditingController gatheringsExpense = new TextEditingController();
  TextEditingController donationZakatExpense = new TextEditingController();
  TextEditingController householdExpense = new TextEditingController();
  TextEditingController familyMembersExpense = new TextEditingController();
  DateTime selectedDate;
  TextEditingController yearController = new TextEditingController();
  Rx<List<dynamic>> expenseYearsList = Rx<List<dynamic>>();
  Rx<List<ExpenseModel>> expenseList = Rx<List<ExpenseModel>>();
  List<ExpenseModel> get expense => expenseList.value;
  Rx<List<ExpenseModel>> reqExpenseList = Rx<List<ExpenseModel>>();
  List<ExpenseModel> get reqExpense => reqExpenseList.value;
  Rx<List<String>> list = Rx<List<String>>([]);
  RxString selectedValue = "".obs;
  String valueDropDown;

  Future getExpense(String id) async {
    list = Rx<List<String>>([]);
    await expenseList.bindStream(allExpenseStream(id));
  }

  Future getRequiredExp(String id, value) async {
    list = Rx<List<String>>([]);
    await reqExpenseList.bindStream(requiredExpenseStream(id, value));
  }

  Stream<List<ExpenseModel>> requiredExpenseStream(id, value) {
    print("enter expense stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('Expense')
        .where("year", isEqualTo: value)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ExpenseModel> retVal = List();
      query.docs.forEach((element) {
        print("year is${element['year']}");
        list.value.add(element['year']);

        retVal.add(ExpenseModel.fromSnapshot(element));
      });
      print('require expense lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<ExpenseModel>> allExpenseStream(id) {
    print("enter expense stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('Expense')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ExpenseModel> retVal = List();
      query.docs.forEach((element) {
        print("year is${element['year']}");
        list.value.add(element['year']);
        print("list is ${list.value}");
        retVal.add(ExpenseModel.fromSnapshot(element));
      });
      print(' expense lenght is ${retVal.length}');
      return retVal;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  final firebaseFirestore = FirebaseFirestore.instance;
  // AuthScreenValidationController authScreenValidationController =
  //     Get.put(AuthScreenValidationController());

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
