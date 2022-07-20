import 'package:admin_taxolution/AdminView/admin_splash.dart';
import 'package:admin_taxolution/Controller/CINCController.dart';
import 'package:admin_taxolution/Controller/all_user_controller.dart';
import 'package:admin_taxolution/Controller/profile_controller.dart';
import 'package:admin_taxolution/Controller/user_assetsController.dart';
import 'package:admin_taxolution/Controller/user_calculatorController.dart';
import 'package:admin_taxolution/Controller/user_expenseController.dart';
import 'package:admin_taxolution/Controller/user_income_informationController.dart';
import 'package:admin_taxolution/Controller/user_informationController.dart';
import 'package:admin_taxolution/Controller/user_paymentController.dart';
import 'package:admin_taxolution/Controller/user_tax_deductionController.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(AllUserController());
  Get.put(UserInformationController());
  Get.put(UserAssetsController());
  Get.put(UserIncomeInformationController());
  Get.put(UserCalculatorController());
  Get.put(UserTaxDeductionController());
  Get.put(UserExpenseController());
  Get.put(UserPaymentController());
  Get.put(ProfileController());
  Get.put(CNICController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Texolution",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AdminWelcome(),
        );
      });
    });
  }
}
