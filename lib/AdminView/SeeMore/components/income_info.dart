import 'package:admin_taxolution/AdminView/SeeMore/more_info_screen.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_income_informationController.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeInfoWidget extends StatefulWidget {
  const IncomeInfoWidget({
    Key key,
    //  @required this.incomeController,
    this.widget,
  }) : super(key: key);

  //final UserIncomeInformationController incomeController;
  final MoreInfoScreen widget;

  @override
  State<IncomeInfoWidget> createState() => _IncomeInfoWidgetState();
}

class _IncomeInfoWidgetState extends State<IncomeInfoWidget> {
  final incomController = Get.put(UserIncomeInformationController());
  @override
  void initState() {
    incomController.getIncome(widget.widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<UserIncomeInformationController>(
        init: Get.put<UserIncomeInformationController>(
            UserIncomeInformationController()),
        builder: (UserIncomeInformationController incomeController) {
          if (incomeController != null &&
              incomeController.incomeInfoList != null) {
            return Container(
              height: SizeConfig.heightMultiplier * 90,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: incomeController.incomeInfo.length,
                  itemBuilder: (context, index) {
                    var income = incomeController.incomeInfo[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Annual salary :'),
                                      Text('${income.annualSal}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Pension Amount :'),
                                      Text('${income.pensionAmount}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Gift Amount :'),
                                      Text('${income.giftAmount}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Inheritenece Amount :'),
                                      Text('${income.inheritedAmount}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Dividend Amount :'),
                                      Text('${income.dividendAmount}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Bank Profit :'),
                                      Text('${income.bankProfit}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Family Contribution Amount :'),
                                      Text('${income.familyContributeAmount}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Property Amount :'),
                                      Text('${income.anPropertyIncome}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Agriculture Amount :'),
                                      Text('${income.agricultureIncome}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Business income Amount :'),
                                      Text('${income.annualBusinessIncome}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Anual Foreign Amount :'),
                                      Text('${income.annualForeignIncome}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Foreign Remittance Amount :'),
                                      Text('${income.foreignRemittance}')
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        incomeController.getOtherIncome(
                                            widget.widget.uid, income.id);
                                        if (incomeController.isClick.value ==
                                            false) {
                                          incomeController.isClick.value = true;
                                        } else {
                                          incomeController.isClick.value =
                                              false;

                                          print('Switch Button is OFF');
                                        }
                                        incomeController.isClick.value =
                                            !incomeController.isClick.value;
                                      },
                                      child: Text("Other Source of income")),
                                  Obx(() => incomeController.isClick.value
                                      ? Container(
                                          height:
                                              SizeConfig.heightMultiplier * 12,
                                          child: incomeController
                                                      .otherIncomeInfo !=
                                                  null
                                              ? ListView.builder(
                                                  itemCount: incomeController
                                                      .otherIncomeInfoList
                                                      .value
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var other = incomeController
                                                        .otherIncomeInfoList
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
                                  income.year,
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
