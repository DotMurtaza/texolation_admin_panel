import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_tax_deductionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaxDetectionTotal extends StatelessWidget {
  const TaxDetectionTotal({Key key, this.liability}) : super(key: key);
  final int liability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Liability"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Tax Detection Total Amount :",
              style: TEXT_STYLE_BLACK_COLOR_W500,
            ),
            GetX<UserTaxDeductionController>(
                init: Get.put<UserTaxDeductionController>(
                    UserTaxDeductionController()),
                builder: (UserTaxDeductionController expenController) {
                  if (expenController != null &&
                      expenController.reqTaxDetection != null) {
                    var exp = expenController.reqTaxDetection[0];
                    return Text(
                      '${exp.bankingTransactionTax + exp.cashWithdrawTax + exp.cellPhoneTax + exp.educationalFee + exp.gathereingTax + exp.internationalAirTicketTax + exp.localAirTicketTax + exp.propetyPurchaseTimeTax + exp.withdrawVoluntry + exp.vehicleTaxDetected + exp.telephoneCallTax + exp.taxRefundpriorYear + exp.taxDetectonPropertySale + exp.taxDetectOnProperty + exp.taxDetectOnPTransfer}',
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
