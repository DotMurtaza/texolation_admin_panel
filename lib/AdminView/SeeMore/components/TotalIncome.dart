import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_income_informationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalIncome extends StatelessWidget {
  const TotalIncome({Key key, this.otherIncomeAmount}) : super(key: key);
  final int otherIncomeAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Income"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Amount :",
              style: TEXT_STYLE_BLACK_COLOR_W500,
            ),
            GetX<UserIncomeInformationController>(
                init: Get.put<UserIncomeInformationController>(
                    UserIncomeInformationController()),
                builder: (UserIncomeInformationController expenController) {
                  if (expenController != null &&
                      expenController.requireIncomeInfo != null) {
                    var exp = expenController.requireIncomeInfo[0];
                    print(expenController.requireIncomeInfo[0].id);
                    return Text(
                      '${otherIncomeAmount + exp.agricultureIncome + exp.anPropertyIncome + exp.anPropertyIncome + exp.annualBusinessIncome + exp.annualForeignIncome + exp.annualSal + exp.bankProfit + exp.dividendAmount + exp.familyContributeAmount + exp.foreignRemittance + exp.giftAmount + exp.inheritedAmount + exp.pCapitalPurchaseValue + exp.pCapitalSaleValue + exp.pensionAmount + exp.propertyCapitalGain + exp.sCapitalAmount + exp.sCostShare}',
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
