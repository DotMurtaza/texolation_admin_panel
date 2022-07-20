import 'package:cloud_firestore/cloud_firestore.dart';

class TaxDetectionModel {
  Timestamp sentAt;
  String year;
  String investmentValue;
  String donationValue;
  double taxDetectOnProperty;
  double taxDetectOnPTransfer;
  double taxDetectonPropertySale;
  double vehicleTaxDetected;
  double cashWithdrawTax;
  double bankingTransactionTax;
  String telePhoneNo;
  String registeredNumberTele;
  double telephoneCallTax;
  String cellPhoneNumber;
  String registerNumberPhone;
  double cellPhoneTax;
  double internetTax;
  String registerInternetNo;
  String internetTaxDetected;
  double propetyPurchaseTimeTax;
  String propertySaleTimeTax;
  double educationalFee;
  double localAirTicketTax;
  double internationalAirTicketTax;
  double gathereingTax;
  double withdrawVoluntry;
  double taxRefundpriorYear;
  double taxDeductionCharityAmount;
  double taxDeductionUnderCharityAmount;
  double taxDeductionAnyInterestAmount;
  double taxDeductionPayAnyTution;
  String id;
  //List<dynamic> otherTaxDetection;
  TaxDetectionModel({
    this.id,
    this.sentAt,
    this.year,
    this.investmentValue,
    this.donationValue,
    this.taxDetectOnProperty,
    this.taxDetectOnPTransfer,
    this.taxDetectonPropertySale,
    this.vehicleTaxDetected,
    this.cashWithdrawTax,
    this.bankingTransactionTax,
    this.telePhoneNo,
    this.registeredNumberTele,
    this.telephoneCallTax,
    this.cellPhoneNumber,
    this.registerNumberPhone,
    this.cellPhoneTax,
    this.internetTax,
    this.registerInternetNo,
    this.internetTaxDetected,
    this.propetyPurchaseTimeTax,
    this.propertySaleTimeTax,
    this.educationalFee,
    this.localAirTicketTax,
    this.internationalAirTicketTax,
    this.gathereingTax,
    this.withdrawVoluntry,
    this.taxRefundpriorYear,
    // this.otherTaxDetection
  });
  TaxDetectionModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    sentAt = snapshot.data()['sentAt'] ?? Timestamp.now();
    year = snapshot.data()['year'] ?? "";
    investmentValue = snapshot.data()['investmentValue'] ?? "";
    donationValue = snapshot.data()['donationValue'] ?? "";
    taxDetectOnProperty = snapshot.data()['taxDetectOnProperty'] ?? 0.0;
    taxDetectOnPTransfer = snapshot.data()['taxDetectOnPTransfer'] ?? 0.0;
    taxDetectonPropertySale = snapshot.data()['taxDetectonPropertySale'] ?? 0.0;
    vehicleTaxDetected = snapshot.data()['vehicleTaxDetected'] ?? 0.0;
    cashWithdrawTax = snapshot.data()['cashWithdrawTax'] ?? 0.0;
    bankingTransactionTax = snapshot.data()['bankingTransactionTax'] ?? 0.0;
    telePhoneNo = snapshot.data()['telePhoneNo'] ?? "";
    registeredNumberTele = snapshot.data()['registeredNumberTele'] ?? "";
    telephoneCallTax = snapshot.data()['telephoneCallTax'] ?? 0.0;
    cellPhoneNumber = snapshot.data()['cellPhoneNumber'] ?? 0.0;
    registerNumberPhone = snapshot.data()['registerNumberPhone'] ?? "";
    cellPhoneTax = snapshot.data()['cellPhoneTax'] ?? 0.0;
    internetTax = snapshot.data()['internetTax'] ?? 0.0;
    registerInternetNo = snapshot.data()['registerInternetNo'] ?? "";
    internetTaxDetected = snapshot.data()['internetTaxDetected'] ?? "";
    propetyPurchaseTimeTax = snapshot.data()['propetyPurchaseTimeTax'] ?? 0.0;
    propertySaleTimeTax = snapshot.data()['propertySaleTimeTax'] ?? "";
    educationalFee = snapshot.data()['educationalFee'] ?? 0.0;
    localAirTicketTax = snapshot.data()['localAirTicketTax'] ?? 0.0;
    internationalAirTicketTax =
        snapshot.data()['internationalAirTicketTax'] ?? 0.0;
    gathereingTax = snapshot.data()['gathereingTax'] ?? 0.0;
    withdrawVoluntry = snapshot.data()['withdrawVoluntry'] ?? 0.0;
    taxRefundpriorYear = snapshot.data()['taxRefundpriorYear'] ?? 0.0;
    // otherTaxDetection= snapshot.data()['otherTaxDetection'] ??[];
  }
}

class OtherTaxDetectionModel {
  String amount;
  String description;
  String tax;
  OtherTaxDetectionModel({this.amount, this.description, this.tax});
  OtherTaxDetectionModel.fromSnapshot(DocumentSnapshot snapshot) {
    amount = snapshot.data()['amount'] ?? "";
    description = snapshot.data()['description'] ?? "";
    tax = snapshot.data()['taxOnIncome'] ?? "";
  }
}
