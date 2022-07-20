import 'package:admin_taxolution/AdminView/SeeMore/components/TotalIncome.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/cnic.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/expense.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/income_info.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/liability_total.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/payments.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/tax_detection.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/tax_detection_total.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/total_assets.dart';
import 'package:admin_taxolution/AdminView/SeeMore/components/total_exp.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_assetsController.dart';
import 'package:admin_taxolution/Controller/user_expenseController.dart';
import 'package:admin_taxolution/Controller/user_income_informationController.dart';
import 'package:admin_taxolution/Controller/user_tax_deductionController.dart';
import 'package:admin_taxolution/Models/asset_libility_model.dart';
import 'package:admin_taxolution/Models/income_info_model.dart';
import 'package:admin_taxolution/Models/tax_detection_model.dart';
import 'package:admin_taxolution/Widget/custom_buttton.dart';
import 'package:admin_taxolution/Widget/custom_dropdown.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({Key key, this.uid}) : super(key: key);
  final String uid;

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  int _activeMeterIndex;
  final incomeCont = Get.put(UserIncomeInformationController());
  final taxDetController = Get.put(UserTaxDeductionController());
  final expController = Get.put(UserExpenseController());
  final assetController = Get.put(UserAssetsController());
  final incomController = Get.put(UserIncomeInformationController());

  @override
  void initState() {
    incomController.getIncome(widget.uid);

    // assetController.getAssets(widget.uid);
    //  print('total amount is: ${getTotal()}');
    // incomeCont.getOtherIncome(widget.uid, income.id);
    incomeCont.isClick.value = false;
    taxDetController.isClick.value = false;
    super.initState();
  }

  int getTotal() => incomeCont.requireOtherIncomeInfo.fold(0, (total, item) {
        int price = int.tryParse(item.amount);
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getAssetpropert() => assetController.property.fold(0, (total, item) {
        int price = int.tryParse(item.propertyValue);
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getanyOtherAsset() => assetController.otherAssets.fold(0, (total, item) {
        int price = int.tryParse(item.anyOtherAssetsAmount);
        print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getMotor() => assetController.motor.fold(0, (total, item) {
        int price = int.tryParse(item.assetsVehiclePriceToPurchase);
        // print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getBanking() => assetController.banking.fold(0, (total, item) {
        int price = int.tryParse(item.assetsBankProfit);
        // print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getCapital() => assetController.businessCaptial.fold(0, (total, item) {
        int price = int.tryParse(item.assetsBusinessCapital);
        // print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getForiegn() => assetController.foreign.fold(0, (total, item) {
        int price = int.tryParse(item.foreignAssetsAmount);
        // print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getMachinery() => assetController.machinery.fold(0, (total, item) {
        int price = int.tryParse(item.assetsMachineryPrice);
        // print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });
  int getLiability() => assetController.laibility.fold(0, (total, item) {
        int price = int.tryParse(item.liabilityAmountInPkr);
        // print("price$price");
        if (price != null)
          return total + price;
        else
          return total;
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 28,
            title: Text("More info"),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(isScrollable: true, indicatorWeight: 5, tabs: [
              Text(
                'Asset & Lib',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              ),
              Text(
                'CNIC',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              ),
              Text(
                'Expense',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              ),
              Text(
                'Income Info',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              ),
              Text(
                'tax Detection',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              ),
              Text(
                'Payment',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              ),
              Text(
                'Total Amounts',
                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
              )
            ]),
          ),
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController assetController) {
                    if (assetController != null &&
                        assetController.assetLibility != null) {
                      return ListView.builder(
                          itemCount: assetController.assetLibility.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      color: Colors.blueAccent,
                                      width: SizeConfig.widthMultiplier * 100,
                                      child: Center(
                                        child: Text(
                                          assetController
                                              .assetLibility[index].year,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      2.1),
                                        ),
                                      )),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(
                                      children: [
                                        Text("Cash in Hand : "),
                                        Spacer(),
                                        Text(assetController
                                            .assetLibility[index].cashInHand),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Wrap(
                                    children: [
                                      AssetsButton(
                                        title: "Property",
                                        onTap: () {
                                          assetController
                                              .getproperty(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  propertyBottomSheet(context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Motor Vehicle",
                                        onTap: () {
                                          assetController
                                              .getMotor(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  motorBottomSheet(context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Machinery Animal",
                                        onTap: () {
                                          assetController
                                              .getMachinery(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  machineryBottomSheet(
                                                      context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Liability",
                                        onTap: () {
                                          assetController
                                              .getLiability(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  getLiabilitySheet(context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Foreign Assets",
                                        onTap: () {
                                          assetController
                                              .getForeignAsset(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  getForignSheet(context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Business Capital",
                                        onTap: () {
                                          assetController
                                              .getBusinessCaptial(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  businessCapitalSheet(
                                                      context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Banking Information",
                                        onTap: () {
                                          assetController
                                              .getBankingInfo(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  bankingSheet(context));
                                        },
                                      ),
                                      AssetsButton(
                                        title: "Any Other Assets",
                                        onTap: () {
                                          assetController
                                              .getOtherAssets(
                                                  widget.uid,
                                                  assetController
                                                      .assetLibility[index].id)
                                              .then((value) =>
                                                  otherAssetSheet(context));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            CNICWidget(),
            ExpInfoWidget(widget: widget),
            IncomeInfoWidget(widget: widget),
            TaxDetectionWidget(widget: widget),
            Payments(),
            //
            Container(
              height: SizeConfig.heightMultiplier * 90,
              width: SizeConfig.widthMultiplier * 100,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     const Divider(),
                     const Text("Expenses total"),
                    const  Divider(),
                      Obx(
                        () => SizedBox(
                          width: 82 * SizeConfig.widthMultiplier,
                          child: CustomDropDown(
                            isBackend: true,
                            dropDownValue:
                                expController.selectedValue.value == ''
                                    ? expController.list.value.length == 0
                                        ? "NO year found"
                                        : expController.list.value[0]
                                    : expController.selectedValue.value,
                            list: expController.list.value,
                            chosenValues: expController.selectedValue.value,
                            hint: '  Select year',
                            selected: (val) {
                              return expController.valueDropDown = val;
                            },
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please select category';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 30,
                        child: CustomButton(
                          isButtonSizeLarge: false,
                          onTap: () {
                            expController
                                .getRequiredExp(
                                    widget.uid, expController.valueDropDown)
                                .then((value) {
                              Get.to(() => TotalExp());
                            });
                            print(
                                "${expController.valueDropDown} + ${widget.uid}");
                          },
                          title: "View",
                        ),
                      ),
                      Divider(),
                      Text("Total income information"),
                      Divider(),
                      GetX<UserIncomeInformationController>(
                          init: Get.put<UserIncomeInformationController>(
                              UserIncomeInformationController()),
                          builder:
                              (UserIncomeInformationController infoController) {
                            if (infoController != null &&
                                infoController.list.value != null) {
                              return SizedBox(
                                  width: 84 * SizeConfig.widthMultiplier,
                                  child: Container(
                                    height: 6 * SizeConfig.heightMultiplier,
                                    width: 86 * SizeConfig.widthMultiplier,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: DropdownButtonFormField<
                                          IncomeInfoModel>(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),

                                        //elevation: 5,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select year';
                                          } else {
                                            return null;
                                          }
                                        },
                                        items: infoController.list.value.map<
                                            DropdownMenuItem<
                                                IncomeInfoModel>>((value) {
                                          return DropdownMenuItem<
                                              IncomeInfoModel>(
                                            value: infoController.value.value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(value.year),
                                            ),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        elevation: 16,
                                        hint: Text(
                                          'Please select year',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            infoController.incomeId.value =
                                                value.id;

                                            infoController.valueDropDown =
                                                value.year;
                                            incomeCont.getRequireotherIncome(
                                                widget.uid,
                                                incomeCont.incomeId.value);
                                            print(
                                                'shopUid: ${infoController.incomeId.value}');

                                            // widget.selected(widget.chosenValues);
                                            // print(widget.selected(widget.chosenValues));
                                          });
                                        },
                                      ),
                                    ),
                                  ));
                            } else {
                              return Text("Loading...");
                            }
                          }),
                      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 30,
                        child: CustomButton(
                          isButtonSizeLarge: false,
                          onTap: () {
                            // incomeCont.getRequireotherIncome(
                            //     widget.uid, incomeCont.incomeId.value);
                            incomeCont
                                .getRequiredIncome(
                                    widget.uid, incomeCont.valueDropDown)
                                .then((value) {
                              int total = getTotal();
                              print('id::;${incomeCont.incomeId.value}');
                              print("user id ${widget.uid}");
                              Get.to(() => TotalIncome(
                                    otherIncomeAmount: total,
                                  ));
                            });
                            print(
                                "${incomeCont.valueDropDown} + ${widget.uid}");
                          },
                          title: "View",
                        ),
                      ),
                      Divider(),
                      Text("Total Assets"),
                      Divider(),
                      GetX<UserAssetsController>(
                          init: Get.put<UserAssetsController>(
                              UserAssetsController()),
                          builder: (UserAssetsController asController) {
                            if (asController != null &&
                                asController.list.value != null) {
                              return SizedBox(
                                  width: 84 * SizeConfig.widthMultiplier,
                                  child: Container(
                                    height: 6 * SizeConfig.heightMultiplier,
                                    width: 86 * SizeConfig.widthMultiplier,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: DropdownButtonFormField<
                                          AssetsAndLiabilityModels>(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),

                                        //elevation: 5,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select year';
                                          } else {
                                            return null;
                                          }
                                        },
                                        items: asController.list.value.map<
                                                DropdownMenuItem<
                                                    AssetsAndLiabilityModels>>(
                                            (value) {
                                          return DropdownMenuItem<
                                              AssetsAndLiabilityModels>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(value.year),
                                            ),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        elevation: 16,
                                        hint: Text(
                                          'Please select year',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            asController.dropDownValue =
                                                value.year;
                                            asController.assetId = value.id;
                                            assetController.getproperty(
                                                widget.uid,
                                                assetController.assetId);
                                            assetController.getRequireAssets(
                                                widget.uid,
                                                assetController.dropDownValue);
                                            assetController.getOtherAssets(
                                                widget.uid,
                                                assetController.assetId);
                                            assetController.getMotor(widget.uid,
                                                assetController.assetId);
                                            assetController.getBankingInfo(
                                                widget.uid,
                                                assetController.assetId);
                                            assetController.getBusinessCaptial(
                                                widget.uid,
                                                assetController.assetId);
                                            assetController.getForeignAsset(
                                                widget.uid,
                                                assetController.assetId);
                                            assetController.getMachinery(
                                                widget.uid,
                                                assetController.assetId);
                                          });
                                          print(
                                              'asset id: ${asController.assetId}');
                                        },
                                        value: asController.value.value,
                                      ),
                                    ),
                                  ));
                            } else {
                              return Text("Loading...");
                            }
                          }),
                      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 30,
                        child: CustomButton(
                          isButtonSizeLarge: false,
                          onTap: () async {
                            // incomeCont.getRequireotherIncome(
                            //     widget.uid, incomeCont.incomeId.value);

                            int property = await getAssetpropert();

                            print(property);
                            int motor = await getMotor();
                            print(motor);
                            int other = await getanyOtherAsset();
                            int bank = await getBanking();
                            int capital = await getCapital();
                            int foriegn = await getForiegn();
                            int machinery = await getMachinery();
                            Get.to(() => TotalAssets(
                                  otherAssets: other,
                                  property: property,
                                  motor: motor,
                                  bank: bank,
                                  capital: capital,
                                  foriegn: foriegn,
                                  machinery: machinery,
                                ));

                            print(
                                "${assetController.dropDownValue} + ${widget.uid}");
                          },
                          title: "View",
                        ),
                      ),
                      Divider(),
                      Text("Total Liability"),
                      Divider(),
                      GetX<UserAssetsController>(
                          init: Get.put<UserAssetsController>(
                              UserAssetsController()),
                          builder: (UserAssetsController asController) {
                            if (asController != null &&
                                asController.list.value != null) {
                              return SizedBox(
                                  width: 84 * SizeConfig.widthMultiplier,
                                  child: Container(
                                    height: 6 * SizeConfig.heightMultiplier,
                                    width: 86 * SizeConfig.widthMultiplier,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: DropdownButtonFormField<
                                          AssetsAndLiabilityModels>(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),

                                        //elevation: 5,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select year';
                                          } else {
                                            return null;
                                          }
                                        },
                                        items: asController.list.value.map<
                                                DropdownMenuItem<
                                                    AssetsAndLiabilityModels>>(
                                            (value) {
                                          return DropdownMenuItem<
                                              AssetsAndLiabilityModels>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(value.year),
                                            ),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        elevation: 16,
                                        hint: Text(
                                          'Please select year',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            asController
                                                    .dropDownValueLiability =
                                                value.year;
                                            asController.assetId = value.id;
                                            asController.getLiability(
                                                widget.uid,
                                                asController.assetId);
                                          });
                                          print(
                                              'asset id: ${asController.assetId}');
                                        },
                                        value: asController.value.value,
                                      ),
                                    ),
                                  ));
                            } else {
                              return Text("Loading...");
                            }
                          }),
                      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 30,
                        child: CustomButton(
                          isButtonSizeLarge: false,
                          onTap: () async {
                            // incomeCont.getRequireotherIncome(
                            //     widget.uid, incomeCont.incomeId.value);

                            // int property = await getAssetpropert();

                            // print(property);
                            int liability = await getLiability();
                            print(liability);

                            Get.to(() => TotalLiability(
                                  liability: liability,
                                ));

                            print(
                                "${assetController.dropDownValue} + ${widget.uid}");
                          },
                          title: "View",
                        ),
                      ),
                      Divider(),
                      Text("Total Tax Detection"),
                      Divider(),
                      GetX<UserTaxDeductionController>(
                          init: Get.put<UserTaxDeductionController>(
                              UserTaxDeductionController()),
                          builder: (UserTaxDeductionController decController) {
                            if (decController != null &&
                                decController.list.value != null) {
                              return SizedBox(
                                  width: 84 * SizeConfig.widthMultiplier,
                                  child: Container(
                                    height: 6 * SizeConfig.heightMultiplier,
                                    width: 86 * SizeConfig.widthMultiplier,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      padding: const EdgeInsets.all(0.0),
                                      child: DropdownButtonFormField<
                                          TaxDetectionModel>(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),

                                        //elevation: 5,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select year';
                                          } else {
                                            return null;
                                          }
                                        },
                                        items: decController.list.value.map<
                                            DropdownMenuItem<
                                                TaxDetectionModel>>((value) {
                                          return DropdownMenuItem<
                                              TaxDetectionModel>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(value.year),
                                            ),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        elevation: 16,
                                        hint: Text(
                                          'Please select year',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            decController
                                                    .dropDownValueLiability =
                                                value.year;
                                            decController.detectionId =
                                                value.id;
                                            decController
                                                .getRequiredTaxDetection(
                                                    widget.uid,
                                                    decController
                                                        .dropDownValueLiability);
                                            // decController.getTaxDetection(
                                            //     widget.uid, asController.assetId);
                                          });
                                          // print(
                                          //     'asset id: ${.assetId}');
                                        },
                                        value: decController.value.value,
                                      ),
                                    ),
                                  ));
                            } else {
                              return Text("Loading...");
                            }
                          }),
                      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 30,
                        child: CustomButton(
                          isButtonSizeLarge: false,
                          onTap: () async {
                            // incomeCont.getRequireotherIncome(
                            //     widget.uid, incomeCont.incomeId.value);

                            // int property = await getAssetpropert();

                            // print(property);
                            // int liability = await getLiability();
                            // print(liability);

                            Get.to(() => TaxDetectionTotal());

                            // print(
                            //     "${assetController.dropDownValue} + ${widget.uid}");
                          },
                          title: "View",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ));
  }

  void propertyBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController proController) {
                    if (proController != null &&
                        proController.property != null) {
                      return ListView.builder(
                        itemCount: proController.property.length,
                        itemBuilder: (bc, index) {
                          var pro = proController.property[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Property Asset",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Plot Type"),
                                    Text(pro.plotType)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Address"),
                                    Text(pro.propertyAddress)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Area"),
                                    Text(pro.propertyArea)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Nature"),
                                    Text(pro.propertyNature)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property value"),
                                    Text(pro.propertyValue)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Purchase Year"),
                                    Text(pro.purchaseMonthyear)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Purchase price"),
                                    Text(pro.purchaseprice)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Sale Year"),
                                    Text(pro.saleMonthYear)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Property Sale Price"),
                                    Text(pro.salePrice)
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void motorBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController motorController) {
                    if (motorController != null &&
                        motorController.motor != null) {
                      return ListView.builder(
                        itemCount: motorController.motor.length,
                        itemBuilder: (bc, index) {
                          var motor = motorController.motor[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Motor vehicle",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Vehicle Price To Purchase"),
                                    Text(motor.assetsVehiclePriceToPurchase)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Vehicle Type"),
                                    Text(motor.assetsVehicleType)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vehicle Type EngineNo"),
                                    Text(motor.assetsVehicleTypeEngineNo)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vehicle Type Model"),
                                    Text(motor.assetsVehicleTypeModel)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vehicle Type Purchased Year"),
                                    Text(motor.assetsVehicleTypePurchasedYear)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("VehicleType RegistrationNo"),
                                    Text(motor.assetsVehicleTypeRegistrationNo)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Name Assets Vehicle"),
                                    Text(motor.nameAssetsVehicle)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void machineryBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController machinaryCont) {
                    if (machinaryCont != null &&
                        machinaryCont.machinery != null) {
                      return ListView.builder(
                        itemCount: machinaryCont.machinery.length,
                        itemBuilder: (bc, index) {
                          var mac = machinaryCont.machinery[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Machinery/Animal",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Machinery Price"),
                                    Text(mac.assetsMachineryPrice)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Machinery Type"),
                                    Text(mac.assetsMachineryType)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void getLiabilitySheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController liabilityCont) {
                    if (liabilityCont != null &&
                        liabilityCont.laibility != null) {
                      return ListView.builder(
                        itemCount: liabilityCont.laibility.length,
                        itemBuilder: (bc, index) {
                          var lia = liabilityCont.laibility[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Liability",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Liability Amount In Pkr"),
                                    Text(lia.liabilityAmountInPkr)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Liability Creditor CNIC"),
                                    Text(lia.liabilityCreditorCNIC)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Liability Description"),
                                    Text(lia.liabilityDescription)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Name Liability Creditor CNIC"),
                                    Text(lia.nameLiabilityCreditorCNIC)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void getForignSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController foreignCont) {
                    if (foreignCont != null && foreignCont.foreign != null) {
                      return ListView.builder(
                        itemCount: foreignCont.foreign.length,
                        itemBuilder: (bc, index) {
                          var fore = foreignCont.foreign[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Liability",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Foreign Assets Amount"),
                                    Text(fore.foreignAssetsAmount)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Foreign Assets Description"),
                                    Text(fore.foreignAssetsDescription)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void businessCapitalSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController businessCont) {
                    if (businessCont != null &&
                        businessCont.businessCaptial != null) {
                      return ListView.builder(
                        itemCount: businessCont.businessCaptial.length,
                        itemBuilder: (bc, index) {
                          var busi = businessCont.businessCaptial[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Business Capital",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Business Captial Name"),
                                    Text(busi.assetsBusinessCapital)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Asset Business Capital"),
                                    Text(busi.assetsBusinessCapital)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void bankingSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController bankCont) {
                    if (bankCont != null && bankCont.banking != null) {
                      return ListView.builder(
                        itemCount: bankCont.banking.length,
                        itemBuilder: (bc, index) {
                          var bank = bankCont.banking[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Banking information",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Account Type Bank"),
                                    Text(bank.accountTypeBank)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets BOP"),
                                    Text(bank.assetsBOP)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Bank AccountNo"),
                                    Text(bank.assetsBankAccountNo)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Bank Profit"),
                                    Text(bank.assetsBankProfit)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Capacity"),
                                    Text(bank.assetsCapacity)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Closing Balance"),
                                    Text(bank.assetsClosingBalance)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Assets Tax Deduction"),
                                    Text(bank.assetsTaxDeduction)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }

  void otherAssetSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              //  height: SizeConfig.heightMultiplier * 50,
              child: GetX<UserAssetsController>(
                  init: Get.put<UserAssetsController>(UserAssetsController()),
                  builder: (UserAssetsController otherCont) {
                    if (otherCont != null && otherCont.otherAssets != null) {
                      return ListView.builder(
                        itemCount: otherCont.otherAssets.length,
                        itemBuilder: (bc, index) {
                          var oth = otherCont.otherAssets[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Other Assets info",
                                  style: TEXT_STYLE_BLUE_COLOR_NORMAL,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Asset description"),
                                    Text(oth.anyOtherAssetsAmount)
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Other Assets Amount"),
                                    Text(oth.anyOtherAssetsAmount)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        });
  }
}

class AssetsButton extends StatelessWidget {
  const AssetsButton({
    Key key,
    this.onTap,
    this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
