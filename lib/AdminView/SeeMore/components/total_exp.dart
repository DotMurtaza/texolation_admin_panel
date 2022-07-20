import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_expenseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalExp extends StatelessWidget {
  const TotalExp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total expenses"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Amount :",
              style: TEXT_STYLE_BLACK_COLOR_W500,
            ),
            GetX<UserExpenseController>(
                init: Get.put<UserExpenseController>(UserExpenseController()),
                builder: (UserExpenseController expenController) {
                  if (expenController != null &&
                      expenController.reqExpense != null) {
                    var exp = expenController.reqExpense[0];
                    return Text(
                      '${exp.clubExpense + exp.assetInsuranceOrSecurityExp + exp.contributionToFamily + exp.contributionToFamily + exp.educationalExpanse + exp.electricityExpense + exp.functionExpense + exp.gasExpense + exp.medicalExpense + exp.personalExpense + exp.rateOrTaxOrCharge + exp.rentExpense + exp.telephoneExpanse + exp.waterExpense + exp.travelingExpense + exp.vehicleMaintenenceExp}',
                      style: TEXT_STYLE_BLACK_COLOR_W700,
                    );
                  } else {
                    return Text(
                      'loading...',
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
