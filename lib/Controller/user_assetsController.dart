import 'dart:ui';

import 'package:admin_taxolution/Models/asset_libility_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserAssetsController extends GetxController {
  Rx<AssetsAndLiabilityModels> value = Rx<AssetsAndLiabilityModels>();

  String assetId = "";

  Rx<List<AssetsAndLiabilityModels>> list =
      Rx<List<AssetsAndLiabilityModels>>([]);

  RxBool isLoading = false.obs;
  TextEditingController annualInheritedPurchasedAssets =
      new TextEditingController();
  TextEditingController yearController = new TextEditingController();
  DateTime selectedDate;
  TextEditingController assetsPropertyAddress = new TextEditingController();
  TextEditingController assetsPropertyValue = new TextEditingController();
  TextEditingController assetsAreaMarlas = new TextEditingController();
  TextEditingController assetsPurchaseMonth = new TextEditingController();
  TextEditingController assetsPurchasePrice = new TextEditingController();
  TextEditingController assetsSaleMonth = new TextEditingController();
  TextEditingController assetsSaleMonthPrice = new TextEditingController();
  TextEditingController assetsGoldTolas = new TextEditingController();
  TextEditingController assetsGoldTolasPrice = new TextEditingController();
  TextEditingController assetsMachineryType = new TextEditingController();
  TextEditingController assetsMachineryPrice = new TextEditingController();
  TextEditingController assetsBusinessCapital = new TextEditingController();
  TextEditingController assetsBusinessName = new TextEditingController();
  TextEditingController nameAssetsVehicle = new TextEditingController();
  TextEditingController assetsVehicleType = new TextEditingController();
  TextEditingController assetsVehicleTypeModel = new TextEditingController();
  TextEditingController assetsVehicleTypeEngineNo = new TextEditingController();
  TextEditingController ownerShip = new TextEditingController();
  RxString currentAddressStateValue = "".obs;
  RxString currentAddressCountryValue = "".obs;
  RxString userCurrentAddressStateValue = "".obs;
  RxString userCurrentAddressCityValue = "".obs;
  TextEditingController assetsVehicleTypePurchasedYear =
      new TextEditingController();
  TextEditingController assetsVehiclePriceToPurchase =
      new TextEditingController();
  TextEditingController assetsVehicleTypeRegistrationNo =
      new TextEditingController();
  TextEditingController assetsBankAccountNo = new TextEditingController();
  TextEditingController assetsBOPP = new TextEditingController();
  TextEditingController assetsCapacity = new TextEditingController();
  TextEditingController assetsClosingBalance = new TextEditingController();
  TextEditingController assetsBankProfit = new TextEditingController();
  TextEditingController assetsTaxDeduction = new TextEditingController();
  TextEditingController foreignAssets = new TextEditingController();
  TextEditingController foreignAssetsAmount = new TextEditingController();
  TextEditingController foreignAssetsDescription = new TextEditingController();
  TextEditingController anyOtherAssets = new TextEditingController();
  TextEditingController anyOtherAssetsAmount = new TextEditingController();
  TextEditingController anyOtherAssetsDescription = new TextEditingController();
  TextEditingController assetsMotorVehicle = new TextEditingController();
  TextEditingController assetsMotorVehiclePrice = new TextEditingController();
  TextEditingController assetsMotorVehicleMake = new TextEditingController();
  TextEditingController assetsMotorVehicleModal = new TextEditingController();
  TextEditingController assetsMotorVehicleEngineCapacity =
      new TextEditingController();
  TextEditingController assetsMotorVehiclePrivate = new TextEditingController();
  TextEditingController assetsMotorVehicleRegistrationNumber =
      new TextEditingController();
  TextEditingController assetsCashInHand = new TextEditingController();
  TextEditingController liabilityAmountInPkr = new TextEditingController();
  TextEditingController liabilityDescription = new TextEditingController();
  TextEditingController liabilityCreditorCNIC = new TextEditingController();
  TextEditingController nameLiabilityCreditorCNIC = new TextEditingController();
  TextEditingController liabilityCreditNonBusines = new TextEditingController();
  String propertyNature;
  Rx<List<dynamic>> yearsList = Rx<List<dynamic>>();
  Rx<List<AssetsAndLiabilityModels>> assetAndLibilityList =
      Rx<List<AssetsAndLiabilityModels>>();
  List<AssetsAndLiabilityModels> get assetLibility =>
      assetAndLibilityList.value;

  Rx<List<AssetsAndLiabilityModels>> requireAssetAndLibilityList =
      Rx<List<AssetsAndLiabilityModels>>();
  List<AssetsAndLiabilityModels> get requireAssetLibility =>
      requireAssetAndLibilityList.value;

  Future getRequireAssets(id, year) async {
    // list = Rx<List<AssetsAndLiabilityModels>>([]);

    await requireAssetAndLibilityList
        .bindStream(requireAssetAndLibilityStream(id, year));
  }

  Stream<List<AssetsAndLiabilityModels>> requireAssetAndLibilityStream(
      id, year) {
    print("enter asset stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .where("year", isEqualTo: year)
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetsAndLiabilityModels> retVal = List();
      query.docs.forEach((element) {
        //list.value.add(AssetsAndLiabilityModels.fromSnapshot(element));
        retVal.add(AssetsAndLiabilityModels.fromSnapshot(element));
      });
      value.value = list.value[0];

      print(' assets lenght is ${retVal.length}');
      return retVal;
    });
  }

  String dropDownValue;
  String dropDownValueLiability;

  @override
  void onReady() {
    super.onReady();
  }

  Future getAssets(id) async {
    list = Rx<List<AssetsAndLiabilityModels>>([]);
    await assetAndLibilityList.bindStream(allAssetAndLibilityStream(id));
  }

  //add to Firestore
  final firebaseFirestore = FirebaseFirestore.instance;
  // AuthScreenValidationController authScreenValidationController =
  //     Get.put(AuthScreenValidationController());
  Stream<List<AssetsAndLiabilityModels>> allAssetAndLibilityStream(id) {
    print("enter asset stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetsAndLiabilityModels> retVal = List();
      query.docs.forEach((element) {
        list.value.add(AssetsAndLiabilityModels.fromSnapshot(element));
        retVal.add(AssetsAndLiabilityModels.fromSnapshot(element));
      });
      value.value = list.value[0];

      print(' assets lenght is ${retVal.length}');
      return retVal;
    });
  }

  //Propert Assets get
  Future getproperty(id, id2) async {
    await propertyList.bindStream(propertyAsset(id, id2));
  }

  Rx<List<AssetPropertyModel>> propertyList = Rx<List<AssetPropertyModel>>();
  List<AssetPropertyModel> get property => propertyList.value;
  Stream<List<AssetPropertyModel>> propertyAsset(id, id2) {
    print("enter asset property stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("property")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetPropertyModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetPropertyModel.fromSnapshot(element));
      });

      print(' assets property lenght is ${retVal.length}');
      return retVal;
    });
  }

  //Motor vehicle Assets get
  Future getMotor(id, id2) async {
    await motorList.bindStream(motorAssets(id, id2));
  }

  Rx<List<AssetMotorVehicleModel>> motorList =
      Rx<List<AssetMotorVehicleModel>>();
  List<AssetMotorVehicleModel> get motor => motorList.value;
  Stream<List<AssetMotorVehicleModel>> motorAssets(id, id2) {
    print("enter asset motor stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("MotorVehicle")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetMotorVehicleModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetMotorVehicleModel.fromSnapshot(element));
      });

      print(' assets motor lenght is ${retVal.length}');
      return retVal;
    });
  }

  //Machinery animal vehicle Assets get
  Future getMachinery(id, id2) async {
    await machineryList.bindStream(machineryAssets(id, id2));
  }

  Rx<List<AssetMachineryModel>> machineryList = Rx<List<AssetMachineryModel>>();
  List<AssetMachineryModel> get machinery => machineryList.value;
  Stream<List<AssetMachineryModel>> machineryAssets(id, id2) {
    print("enter asset machinery stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("MachineryAnimal")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetMachineryModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetMachineryModel.fromSnapshot(element));
      });

      print(' assets motor lenght is ${retVal.length}');
      return retVal;
    });
  }

  //Laibility animal vehicle Assets get
  Future getLiability(id, id2) async {
    await laibilityList.bindStream(laibilityAssets(id, id2));
  }

  Rx<List<AssetLiabilityModel>> laibilityList = Rx<List<AssetLiabilityModel>>();
  List<AssetLiabilityModel> get laibility => laibilityList.value;
  Stream<List<AssetLiabilityModel>> laibilityAssets(id, id2) {
    print("enter asset Liability stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("Liability")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetLiabilityModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetLiabilityModel.fromSnapshot(element));
      });

      print(' assets Liability lenght is ${retVal.length}');
      return retVal;
    });
  }

  //Laibility animal vehicle Assets get
  Future getForeignAsset(id, id2) async {
    await foreignAssetList.bindStream(foreignAsset(id, id2));
  }

  Rx<List<AssetForeignModel>> foreignAssetList = Rx<List<AssetForeignModel>>();
  List<AssetForeignModel> get foreign => foreignAssetList.value;
  Stream<List<AssetForeignModel>> foreignAsset(id, id2) {
    print("enter asset ForeignAssets stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("ForeignAssets")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetForeignModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetForeignModel.fromSnapshot(element));
      });

      print(' assets ForeignAssets lenght is ${retVal.length}');
      return retVal;
    });
  }

  //Laibility animal vehicle Assets get
  Future getBusinessCaptial(id, id2) async {
    await businessCaptialList.bindStream(streamBusinessCaptial(id, id2));
  }

  Rx<List<AssetBusinessModel>> businessCaptialList =
      Rx<List<AssetBusinessModel>>();
  List<AssetBusinessModel> get businessCaptial => businessCaptialList.value;
  Stream<List<AssetBusinessModel>> streamBusinessCaptial(id, id2) {
    print("enter asset ForeignAssets stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("BusinessCapital")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetBusinessModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetBusinessModel.fromSnapshot(element));
      });

      print(' assets ForeignAssets lenght is ${retVal.length}');
      return retVal;
    });
  }

  //banking animal vehicle Assets get
  Future getBankingInfo(id, id2) async {
    await bankingInfoList.bindStream(streamBanking(id, id2));
  }

  Rx<List<AssetBankModel>> bankingInfoList = Rx<List<AssetBankModel>>();
  List<AssetBankModel> get banking => bankingInfoList.value;
  Stream<List<AssetBankModel>> streamBanking(id, id2) {
    print("enter asset BankingInformation stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("BankingInformation")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetBankModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetBankModel.fromSnapshot(element));
      });

      print(' assets BankingInformation lenght is ${retVal.length}');
      return retVal;
    });
  }

  //banking animal vehicle Assets get
  Future getOtherAssets(id, id2) async {
    await otherAssetList.bindStream(streamOtherAssets(id, id2));
  }

  Rx<List<AssetAnyOtherAssetModel>> otherAssetList =
      Rx<List<AssetAnyOtherAssetModel>>();
  List<AssetAnyOtherAssetModel> get otherAssets => otherAssetList.value;
  Stream<List<AssetAnyOtherAssetModel>> streamOtherAssets(id, id2) {
    print("enter asset AnyOtherAssets stream funtion");
    return firebaseFirestore
        .collection('UserProfile')
        .doc(id)
        .collection('AssetsAndLiability')
        .doc(id2)
        .collection("AnyOtherAssets")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AssetAnyOtherAssetModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(AssetAnyOtherAssetModel.fromSnapshot(element));
      });

      print(' assets AnyOtherAssets lenght is ${retVal.length}');
      return retVal;
    });
  }

  selectYear(BuildContext context) async {
    DateTime newDateTime = await showRoundedDatePicker(
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
      height: 200,
      context: context,
      initialDate: selectedDate != null ? selectedDate : DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      theme: ThemeData(primarySwatch: Colors.blue),
    );

    if (newDateTime != null) {
      selectedDate = newDateTime;

      yearController
        ..text = DateFormat.y().format(selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: yearController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  // Stream<List<dynamic>> checkYear() {
  //   return FirebaseFirestore.instance
  //       .collection('UserProfile')
  //       .doc(authScreenValidationController.auth.currentUser.uid)
  //       .collection('AssetsAndLiability')
  //       .where('year', isEqualTo: yearController.value.text)
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     print('rel${query.docs.length}');
  //     List<dynamic> retVal = [];
  //     for (var element in query.docs) {
  //       retVal.add(element);
  //       print('len ${retVal.length}');
  //     }
  //     return retVal;
  //   });
  // }
}
