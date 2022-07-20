import 'package:flutter/cupertino.dart';

class MyTextEditingModel {
  TextEditingController otherSourceIncome;
  TextEditingController otherSourceDisc;
  TextEditingController otherSourceTax;

  MyTextEditingModel(
      {this.otherSourceIncome, this.otherSourceDisc, this.otherSourceTax});

  Map toJson() => {
    'otherSourceIncome': otherSourceIncome.text,
    'otherSourceDisc': otherSourceDisc.text,
    'otherSourceTax': otherSourceTax.text,

  };
}


