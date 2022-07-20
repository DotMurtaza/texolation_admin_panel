import 'package:admin_taxolution/AdminView/SeeMore/more_info_screen.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/CINCController.dart';
import 'package:admin_taxolution/Controller/payment_controller.dart';
import 'package:admin_taxolution/Controller/user_assetsController.dart';
import 'package:admin_taxolution/Controller/user_expenseController.dart';
import 'package:admin_taxolution/Controller/user_income_informationController.dart';
import 'package:admin_taxolution/Controller/user_tax_deductionController.dart';
import 'package:admin_taxolution/Models/income_info_model.dart';
import 'package:admin_taxolution/Models/user_profile_model.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key key, this.users}) : super(key: key);
  final UserProfileModel users;
  IncomeInfoModel other;
  RxBool isLoading = false.obs;
  final assetsAndLiability = Get.put(UserAssetsController());
  final expenseController = Get.put(UserExpenseController());
  final taxDetectionController = Get.put(UserTaxDeductionController());
  final cnicController = Get.put(CNICController());
  final payController = Get.put(PaymentController());
  final incomeInfoController = Get.put(UserIncomeInformationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text(users.emailId)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataRow(
                label: 'First Name',
                value: users.firstName,
              ),
              Divider(),
              DataRow(
                label: 'Last Name',
                value: users.lastName,
              ),
              Divider(),
              DataRow(
                label: 'CNIC',
                value: users.cnic,
              ),
              Divider(),
              DataRow(
                label: 'DOB',
                value: users.dateOfBirth,
              ),
              Divider(),
              DataRow(
                label: 'Gender',
                value: users.userGender,
              ),
              Divider(),
              DataRow(
                label: 'Residential',
                value: users.residentialStatus,
              ),
              Divider(),
              DataRow(
                label: 'Source Of Income from',
                value: users.sourceOfIncome,
              ),
              Divider(),
              DataRow(
                label: 'Contact No',
                value: users.phoneNo,
              ),
              Divider(),
              DataRow(
                label: 'Other Contact No',
                value: users.otherPhoneNo,
              ),
              Divider(),
              DataRow(
                label: 'Property Type',
                value: users.propertyType,
              ),
              Divider(),
              DataRow(
                label: 'Current Address',
                value:
                    '${users.currentCountry + "," + users.currentState + "," + users.currentCity + "," + users.currentAddress}',
              ),
              Divider(),
              DataRow(
                label: 'Permanent Address',
                value:
                    '${users.permanentCountry + "," + users.permanentState + "," + users.permanentCity + "," + users.permanentAddress}',
              ),
              Divider(),
              DataRow(
                label: 'Business Address',
                value:
                    '${users.businessCountry + "," + users.businessState + "," + users.businessCity + "," + users.businessAddress}',
              ),
              Divider(),
              DataRow(
                label: 'Fsoreign Address',
                value:
                    '${users.foreignCountry + "," + users.foreignState + "," + users.foreignCity + "," + users.foreignAddress}',
              ),
              Divider(),
              Obx(() => isLoading.value == true
                  ? Center(child: CircularProgressIndicator())
                  : TextButton(
                      onPressed: () async {
                        isLoading.value = true;
                        try {
                          await incomeInfoController.getIncome(users.id);

                          await payController.getPayments(users.id);
                          await cnicController.getCNICImages(users.id);
                          await taxDetectionController
                              .getTaxDetection(users.id);
                          await expenseController.getExpense(users.id);
                          await assetsAndLiability
                              .getAssets(users.id)
                              .then((value) {
                            isLoading.value = false;
                            Get.to(MoreInfoScreen(
                              uid: users.id,
                            ));
                          });
                        } catch (e) {
                          isLoading.value = false;

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Some thing went wrong. This user have not more data")));
                        }
                      },
                      child: const Text('See More...')))
            ],
          ),
        ),
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({
    Key key,
    this.label,
    this.value,
  }) : super(key: key);

  final label;
  final value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: TEXT_STYLE_LITE_GREY_COLOR_NORMAL,
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 15,
          ),
          Flexible(
              child: Text(value,
                  overflow: TextOverflow.fade,
                  style: TEXT_STYLE_BLACK_COLOR_W600)),
        ],
      ),
    );
  }
}
