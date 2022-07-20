import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCalculatorController extends GetxController {
  TextEditingController enterMonthlySalary = TextEditingController();
  RxInt monthlySalary = 0.obs;
  RxInt monthlyTax = 0.obs;
  RxInt salaryAfterTax = 0.obs;
  RxInt yearlySalary = 0.obs;
  RxString yearlyTax = "".obs;
  RxInt yearlySalaryAfterTax = 0.obs;

  void clearAllControllers() {
    enterMonthlySalary.clear();
    monthlySalary = 0.obs;
    monthlyTax = 0.obs;
    salaryAfterTax = 0.obs;
    yearlySalary = 0.obs;
    yearlyTax = "".obs;
    yearlySalaryAfterTax = 0.obs;
  }

  @override
  void onReady() {
    super.onReady();
  }
}
