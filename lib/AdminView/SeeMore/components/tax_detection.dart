import 'package:admin_taxolution/AdminView/SeeMore/more_info_screen.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_tax_deductionController.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaxDetectionWidget extends StatelessWidget {
  const TaxDetectionWidget({
    Key key,
    this.widget,
    // @required this.taxDecController,
  }) : super(key: key);

  final MoreInfoScreen widget;
  // final UserTaxDeductionController taxDecController;

  @override
  Widget build(BuildContext context) {
    return GetX<UserTaxDeductionController>(
        init: Get.put<UserTaxDeductionController>(UserTaxDeductionController()),
        builder: (UserTaxDeductionController taxDecController) {
          if (taxDecController != null &&
              taxDecController.taxDetectionList != null) {
            return Container(
              height: SizeConfig.heightMultiplier * 90,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: taxDecController.taxDetectionList.value.length,
                  itemBuilder: (context, index) {
                    var taxDec = taxDecController.taxDetectionList.value[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Banking Transaction Tax :'),
                                      Text('${taxDec.bankingTransactionTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Cash Withdraw Tax :'),
                                      Text('${taxDec.cashWithdrawTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('cell PhoneNumber :'),
                                      Text('${taxDec.cellPhoneNumber}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('cell Phone Tax :'),
                                      Text('${taxDec.cellPhoneTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('donation Value :'),
                                      Text('${taxDec.donationValue}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('educational Fee :'),
                                      Text('${taxDec.educationalFee}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('gathereing Tax:'),
                                      Text('${taxDec.gathereingTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('international Air Ticket Tax :'),
                                      Text(
                                          '${taxDec.internationalAirTicketTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Internet Tax :'),
                                      Text('${taxDec.internetTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('internet Tax Detected :'),
                                      Text('${taxDec.internetTaxDetected}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('investment Amount :'),
                                      Text('${taxDec.investmentValue}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('local Air Ticket Tax :'),
                                      Text('${taxDec.localAirTicketTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('property Sale Time Tax :'),
                                      Text('${taxDec.propertySaleTimeTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('propety Purchase Time Tax :'),
                                      Text('${taxDec.propetyPurchaseTimeTax}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('register Internet No:'),
                                      Text('${taxDec.registerInternetNo}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('register Number Phone :'),
                                      Text('${taxDec.registerNumberPhone}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('registered Number Tele :'),
                                      Text('${taxDec.registeredNumberTele}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'taxDeduction Any Interest Amount :'),
                                      Text(
                                          '${taxDec.taxDeductionAnyInterestAmount}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('tax Deduction Charity Amount :'),
                                      Text(
                                          '${taxDec.taxDeductionCharityAmount}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('tax Deduction Pay Any Tution :'),
                                      Text('${taxDec.taxDeductionPayAnyTution}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'taxDeduction Under Charity Amount :'),
                                      Text(
                                          '${taxDec.taxDeductionUnderCharityAmount}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('taxDetect On Property Transfer :'),
                                      Text('${taxDec.taxDetectOnPTransfer}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('taxDetect On Property :'),
                                      Text('${taxDec.taxDetectOnProperty}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('taxDetecton Property Sale :'),
                                      Text('${taxDec.taxDetectonPropertySale}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('tax Refund prior Year:'),
                                      Text('${taxDec.taxRefundpriorYear}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('tele Phone No :'),
                                      Text('${taxDec.telePhoneNo}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('withdraw Voluntry :'),
                                      Text('${taxDec.withdrawVoluntry}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('vehicle Tax Detected:'),
                                      Text('${taxDec.vehicleTaxDetected}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('telephone Call Tax :'),
                                      Text('${taxDec.telephoneCallTax}')
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        // showLoading();
                                        taxDecController.getOtherTaxDectection(
                                            widget.uid, taxDec.id);
                                        if (taxDecController.isClick.value ==
                                            false) {
                                          taxDecController.isClick.value = true;
                                        } else {
                                          taxDecController.isClick.value =
                                              false;

                                          print('Switch Button is OFF');
                                        }
                                        print(taxDecController.isClick);
                                        // dismissLoadingWidget();
                                      },
                                      child: Text("Other Source of income")),
                                  Obx(() => taxDecController.isClick.value
                                      ? Container(
                                          height:
                                              SizeConfig.heightMultiplier * 12,
                                          child: taxDecController
                                                      .otherTaxDetection !=
                                                  null
                                              ? ListView.builder(
                                                  itemCount: taxDecController
                                                      .otherTaxDetectionList
                                                      .value
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var other = taxDecController
                                                        .otherTaxDetectionList
                                                        .value[index];
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Other Sources Amount :'),
                                                            Text(
                                                                '${other.amount}')
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Other Sources Description :'),
                                                            Text(
                                                                '${other.description}')
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Other Sources tax :'),
                                                            Text('${other.tax}')
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ))
                                      : SizedBox())
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Container(
                                width: SizeConfig.widthMultiplier * 25,
                                height: SizeConfig.heightMultiplier * 3.5,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                    child: Text(
                                  taxDec.year,
                                  style: TEXT_STYLE_WHITE_COLOR_NORMAL,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
