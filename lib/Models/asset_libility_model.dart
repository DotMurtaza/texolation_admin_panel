import 'package:cloud_firestore/cloud_firestore.dart';

class AssetsAndLiabilityModels {
  String year;
  String cashInHand;
  String id;
  // List<dynamic> property;
  // List<dynamic> goldOrPreciousItem;
  // List<dynamic> machineryOrAnimal;
  // List<dynamic> businessCapital;
  // List<dynamic> motorVehicle;
  // List<dynamic> bankInvestmentDepositReceivable;
  // List<dynamic> foreignAssets;
  // List<dynamic> otherAsset;

  // List<dynamic> liability;
  AssetsAndLiabilityModels({this.id, this.cashInHand, this.year});
  AssetsAndLiabilityModels.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    year = snapshot.data()['year'] ?? "";
    cashInHand = snapshot.data()['cashInHand'] ?? "";
  }
}

class AssetPropertyModel {
  String propertyValue;
  String propertyAddress;
  String propertyArea;
  String propertyNature;
  String plotType;
  String purchaseMonthyear;
  String purchaseprice;
  String saleMonthYear;
  String salePrice;
  String ownerShip;
  String country;
  String state;
  String city;
  AssetPropertyModel(
      {this.plotType,
      this.ownerShip,
      this.country,
      this.state,
      this.city,
      this.propertyAddress,
      this.propertyArea,
      this.propertyNature,
      this.propertyValue,
      this.purchaseMonthyear,
      this.purchaseprice,
      this.saleMonthYear,
      this.salePrice});
  AssetPropertyModel.fromSnapshot(DocumentSnapshot snapshot) {
    ownerShip = snapshot.data()["ownerShip"] ?? "";
    country = snapshot.data()["country"] ?? "";
    state = snapshot.data()["state"] ?? "";
    city = snapshot.data()["city"] ?? "";
    propertyNature = snapshot.data()['propertyNature'] ?? "";
    plotType = snapshot.data()['plotType'] ?? "";
    propertyArea = snapshot.data()['propertyArea'] ?? "";
    propertyAddress = snapshot.data()['propertyAddress'] ?? "";
    propertyValue = snapshot.data()['propertyValue'] ?? "";
    purchaseprice = snapshot.data()['purchaseprice'] ?? "";
    purchaseMonthyear = snapshot.data()['purchaseMonthyear'] ?? "";
    salePrice = snapshot.data()['salePrice'] ?? "";
    saleMonthYear = snapshot.data()['saleMonthYear'] ?? "";
  }
}

class AssetGoldModel {
  String assetsGoldTolas;
  String assetsGoldTolasPrice;
  AssetGoldModel({
    this.assetsGoldTolas,
    this.assetsGoldTolasPrice,
  });
  AssetGoldModel.fromSnapshot(DocumentSnapshot snapshot) {
    assetsGoldTolas = snapshot.data()["assetsGoldTolas"] ?? "";
    assetsGoldTolasPrice = snapshot.data()["assetsGoldTolasPrice"] ?? "";
  }
}

class AssetMachineryModel {
  String assetsMachineryType;
  String assetsMachineryPrice;
  AssetMachineryModel({
    this.assetsMachineryType,
    this.assetsMachineryPrice,
  });
  AssetMachineryModel.fromSnapshot(DocumentSnapshot snapshot) {
    assetsMachineryType = snapshot.data()["assetsMachineryType"] ?? "";
    assetsMachineryPrice = snapshot.data()["assetsMachineryPrice"] ?? "";
  }
}

class AssetBusinessModel {
  String assetsBusinessCapital;
  String assetsBusinessName;
  AssetBusinessModel({
    this.assetsBusinessCapital,
    this.assetsBusinessName,
  });
  AssetBusinessModel.fromSnapshot(DocumentSnapshot snapshot) {
    assetsBusinessCapital = snapshot.data()["assetsBusinessCapital"] ?? "";
    assetsBusinessName = snapshot.data()["assetsBusinessName"] ?? "";
  }
}

class AssetMotorVehicleModel {
  String nameAssetsVehicle;
  String assetsVehicleType;
  String assetsVehicleTypeModel;
  String assetsVehicleTypeEngineNo;
  String assetsVehicleTypePurchasedYear;
  String assetsVehicleTypeRegistrationNo;
  String assetsVehiclePriceToPurchase;
  AssetMotorVehicleModel({
    this.assetsVehiclePriceToPurchase,
    this.assetsVehicleType,
    this.assetsVehicleTypeEngineNo,
    this.assetsVehicleTypeModel,
    this.assetsVehicleTypePurchasedYear,
    this.assetsVehicleTypeRegistrationNo,
    this.nameAssetsVehicle,
  });
  AssetMotorVehicleModel.fromSnapshot(DocumentSnapshot snapshot) {
    nameAssetsVehicle = snapshot.data()['nameAssetsVehicle'] ?? "";
    assetsVehicleType = snapshot.data()['assetsVehicleType'] ?? "";
    assetsVehicleTypeModel = snapshot.data()['assetsVehicleTypeModel'] ?? "";
    assetsVehicleTypeEngineNo =
        snapshot.data()['assetsVehicleTypeEngineNo'] ?? "";
    assetsVehicleTypePurchasedYear =
        snapshot.data()['assetsVehicleTypePurchasedYear'] ?? "";
    assetsVehicleTypeRegistrationNo =
        snapshot.data()['assetsVehicleTypeRegistrationNo'] ?? "";
    assetsVehiclePriceToPurchase =
        snapshot.data()['assetsVehiclePriceToPurchase'] ?? "";
  }
}

class AssetBankModel {
  String assetsBankAccountNo;
  String assetsBOP;
  String assetsCapacity;
  String assetsClosingBalance;
  String assetsBankProfit;
  String assetsTaxDeduction;
  String accountTypeBank;
  AssetBankModel({
    this.accountTypeBank,
    this.assetsBankAccountNo,
    this.assetsBankProfit,
    this.assetsBOP,
    this.assetsCapacity,
    this.assetsClosingBalance,
    this.assetsTaxDeduction,
  });
  AssetBankModel.fromSnapshot(DocumentSnapshot snapshot) {
    accountTypeBank = snapshot.data()['accountTypeBank'] ?? "";
    assetsBankAccountNo = snapshot.data()['assetsBankAccountNo'] ?? "";
    assetsBankProfit = snapshot.data()['assetsBankProfit'] ?? "";
    assetsBOP = snapshot.data()['assetsBOP'] ?? "";
    assetsCapacity = snapshot.data()['assetsCapacity'] ?? "";
    assetsClosingBalance = snapshot.data()['assetsClosingBalance'] ?? "";
    assetsTaxDeduction = snapshot.data()['assetsTaxDeduction'] ?? "";
  }
}

class AssetForeignModel {
  String foreignAssetsDescription;
  String foreignAssetsAmount;
  AssetForeignModel({
    this.foreignAssetsAmount,
    this.foreignAssetsDescription,
  });
  AssetForeignModel.fromSnapshot(DocumentSnapshot snapshot) {
    foreignAssetsAmount = snapshot.data()['foreignAssetsAmount'] ?? "";
    foreignAssetsDescription =
        snapshot.data()['foreignAssetsDescription'] ?? "";
  }
}

class AssetLiabilityModel {
  String liabilityAmountInPkr;
  String liabilityCreditorCNIC;
  String nameLiabilityCreditorCNIC;
  String liabilityDescription;
  AssetLiabilityModel({
    this.liabilityAmountInPkr,
    this.liabilityCreditorCNIC,
    this.liabilityDescription,
    this.nameLiabilityCreditorCNIC,
  });
  AssetLiabilityModel.fromSnapshot(DocumentSnapshot snapshot) {
    liabilityAmountInPkr = snapshot.data()['liabilityAmountInPkr'] ?? "";
    liabilityCreditorCNIC = snapshot.data()['liabilityCreditorCNIC'] ?? "";
    liabilityDescription = snapshot.data()['liabilityDescription'] ?? "";
    nameLiabilityCreditorCNIC =
        snapshot.data()['nameLiabilityCreditorCNIC'] ?? "";
  }
}

class AssetAnyOtherAssetModel {
  String anyOtherAssetsDescription;
  String anyOtherAssetsAmount;
  AssetAnyOtherAssetModel(
      {this.anyOtherAssetsAmount, this.anyOtherAssetsDescription});
  AssetAnyOtherAssetModel.fromSnapshot(DocumentSnapshot snapshot) {
    anyOtherAssetsDescription =
        snapshot.data()['anyOtherAssetsDescription'] ?? "";
    anyOtherAssetsAmount = snapshot.data()['anyOtherAssetsAmount'] ?? "";
  }
}
