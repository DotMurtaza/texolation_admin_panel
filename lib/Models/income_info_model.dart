import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeInfoModel {
  Timestamp sentAt;
  String year;
  double annualSal;
  double taxOnAnnualSal;
  double anPropertyIncome;
  double taxOnProperty;
  double annualBusinessIncome;
  double taxOnBusinessIncome;
  double annualForeignIncome;
  double taxOnForeignIncome;
  double agricultureIncome;
  double taxPaidOnAgriculture;
  double propertyCapitalGain;
  String pCapitalPlotAddress;
  double pCapitalPlotSize;
  double pCapitalPurchaseValue;
  double pCapitalSaleValue;
  String pCapitalPurchaseDate;
  String pCapitalSaleDate;
  double sCapitalAmount;
  double sTaxOnSCapital;
  double sCostShare;
  double bankProfit;
  double txOnBankProfit;
  String selectDividend;
  double dividendAmount;
  double taxOnDividend;
  double giftAmount;
  double inheritedAmount;
  double foreignRemittance;
  double familyContributeAmount;
  double pensionAmount;
  //List<dynamic> otherSource;
  String id;
  IncomeInfoModel(
      {this.agricultureIncome,
      this.anPropertyIncome,
      this.annualBusinessIncome,
      this.annualForeignIncome,
      this.bankProfit,
      this.annualSal,
      this.dividendAmount,
      this.familyContributeAmount,
      this.foreignRemittance,
      this.giftAmount,
      this.inheritedAmount,
      // this.otherSource,
      this.pCapitalPlotAddress,
      this.pCapitalPlotSize,
      this.pCapitalPurchaseDate,
      this.pCapitalPurchaseValue,
      this.pCapitalSaleDate,
      this.id,
      this.pCapitalSaleValue,
      this.pensionAmount,
      this.propertyCapitalGain,
      this.sCapitalAmount,
      this.sCostShare,
      this.sTaxOnSCapital,
      this.selectDividend,
      this.sentAt,
      this.taxOnAnnualSal,
      this.taxOnDividend,
      this.taxOnForeignIncome,
      this.taxOnProperty,
      this.taxOnBusinessIncome,
      this.taxPaidOnAgriculture,
      this.txOnBankProfit,
      this.year});
  IncomeInfoModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    sCostShare = snapshot.data()['sCostShare'] ?? 0.0;
    sCapitalAmount = snapshot.data()['sCapitalAmount'] ?? 0.0;
    year = snapshot.data()['year'] ?? "";
    txOnBankProfit = snapshot.data()['txOnBankProfit'] ?? 0.0;
    taxPaidOnAgriculture = snapshot.data()['taxPaidOnAgriculture'] ?? 0.0;
    taxOnBusinessIncome = snapshot.data()['taxOnBusinessIncome'] ?? 0.0;
    taxOnProperty = snapshot.data()['taxOnProperty'] ?? 0.0;
    taxOnForeignIncome = snapshot.data()['taxOnForeignIncome'] ?? 0.0;
    taxOnDividend = snapshot.data()['taxOnDividend'] ?? 0.0;
    taxOnAnnualSal = snapshot.data()['taxOnAnnualSal'] ?? 0.0;
    sentAt = snapshot.data()['sentAt'] ?? Timestamp.now();
    selectDividend = snapshot.data()['selectDividend'] ?? "";
    sTaxOnSCapital = snapshot.data()['sTaxOnSCapital'] ?? 0.0;
    propertyCapitalGain = snapshot.data()['propertyCapitalGain'] ?? 0.0;
    pensionAmount = snapshot.data()['pensionAmount'] ?? 0.0;
    pCapitalSaleValue = snapshot.data()['pCapitalSaleValue'] ?? 0.0;
    pCapitalSaleDate = snapshot.data()['pCapitalSaleDate'] ?? "";
    pCapitalPurchaseValue = snapshot.data()['pCapitalPurchaseValue'] ?? 0.0;
    pCapitalPurchaseDate = snapshot.data()['pCapitalPurchaseDate'] ?? "";
    pCapitalPlotSize = snapshot.data()['pCapitalPlotSize'] ?? 0.0;
    pCapitalPlotAddress = snapshot.data()['pCapitalPlotAddress'] ?? "";
    agricultureIncome = snapshot.data()['agricultureIncome'] ?? 0.0;
    anPropertyIncome = snapshot.data()['anPropertyIncome'] ?? 0.0;
    annualBusinessIncome = snapshot.data()['annualBusinessIncome'] ?? 0.0;
    annualForeignIncome = snapshot.data()['annualForeignIncome'] ?? 0.0;
    bankProfit = snapshot.data()['bankProfit'] ?? 0.0;
    annualSal = snapshot.data()['annualSal'] ?? 0.0;
    dividendAmount = snapshot.data()['dividendAmount'] ?? 0.0;
    familyContributeAmount = snapshot.data()['familyContributeAmount'] ?? 0.0;
    foreignRemittance = snapshot.data()['foreignRemittance'] ?? 0.0;
    giftAmount = snapshot.data()['giftAmount'] ?? 0.0;
    inheritedAmount = snapshot.data()['inheritedAmount'] ?? 0.0;
    // otherSource = snapshot.data()['otherSource'] ?? [];
  }
}

class OtherIncomesModel {
  String amount;
  String description;
  String tax;
  String id;
  OtherIncomesModel({this.id, this.amount, this.description, this.tax});
  OtherIncomesModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    amount = snapshot.data()['amount'] ?? "";
    description = snapshot.data()['description'] ?? "";
    tax = snapshot.data()['taxOnIncome'] ?? "";
  }
}
