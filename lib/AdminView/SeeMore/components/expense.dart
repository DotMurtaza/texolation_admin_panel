import 'package:admin_taxolution/AdminView/SeeMore/more_info_screen.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_expenseController.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpInfoWidget extends StatelessWidget {
  const ExpInfoWidget({
    Key key,
    //  @required this.expCont,
    this.widget,
  }) : super(key: key);

  //final UserExpenseController expCont;
  final MoreInfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return GetX<UserExpenseController>(
        init: Get.put<UserExpenseController>(UserExpenseController()),
        builder: (UserExpenseController expenseController) {
          if (expenseController != null &&
              expenseController.expenseList != null) {
            return Container(
              padding: EdgeInsets.only(top: 10),
              height: SizeConfig.heightMultiplier * 90,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: expenseController.expenseList.value.length,
                  itemBuilder: (context, index) {
                    var exp = expenseController.expenseList.value[index];
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
                                      Text('Asset Insurance Or Security Exp :'),
                                      Text('${exp.assetInsuranceOrSecurityExp}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Club Expenses :'),
                                      Text('${exp.clubExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Contribution To Family Exp:'),
                                      Text('${exp.contributionToFamily}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Educational Exp :'),
                                      Text('${exp.educationalExpanse}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Electricity Exp :'),
                                      Text('${exp.electricityExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Functions Expense :'),
                                      Text('${exp.functionExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Gas Expense :'),
                                      Text('${exp.gasExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Medical Expense :'),
                                      Text('${exp.medicalExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Personal Expense :'),
                                      Text('${exp.personalExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Rate Or Tax Or Charge :'),
                                      Text('${exp.rateOrTaxOrCharge}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Rent Expense :'),
                                      Text('${exp.rentExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Telephone Expanse :'),
                                      Text('${exp.telephoneExpanse}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Travelling Expanse :'),
                                      Text('${exp.travelingExpense}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Vehicle Maintenence Expanse :'),
                                      Text('${exp.vehicleMaintenenceExp}')
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Water Expanse :'),
                                      Text('${exp.waterExpense}')
                                    ],
                                  ),
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
                                  exp.year,
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
