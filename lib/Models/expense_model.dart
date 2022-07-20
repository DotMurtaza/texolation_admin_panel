import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  Timestamp sentAt;
  String year;
  double rentExpense;
  double rateOrTaxOrCharge;
  double vehicleMaintenenceExp;
  double travelingExpense;
  double electricityExpense;
  double waterExpense;
  double gasExpense;
  double telephoneExpanse;
  double assetInsuranceOrSecurityExp;
  double medicalExpense;
  double educationalExpanse;
  double clubExpense;
  double functionExpense;
  double personalExpense;
  double contributionToFamily;
  String id;
  ExpenseModel(
      {this.assetInsuranceOrSecurityExp,
      this.clubExpense,
      this.id,
      this.contributionToFamily,
      this.educationalExpanse,
      this.electricityExpense,
      this.functionExpense,
      this.gasExpense,
      this.medicalExpense,
      this.personalExpense,
      this.rateOrTaxOrCharge,
      this.rentExpense,
      this.sentAt,
      this.telephoneExpanse,
      this.travelingExpense,
      this.vehicleMaintenenceExp,
      this.waterExpense,
      this.year});
  ExpenseModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    year = snapshot.data()['year'] ?? 0.0;
    waterExpense = snapshot.data()['waterExpense'] ?? 0.0;
    vehicleMaintenenceExp = snapshot.data()['vehicleMaintenenceExp'] ?? 0.0;
    travelingExpense = snapshot.data()['travelingExpense'] ?? 0.0;
    telephoneExpanse = snapshot.data()['telephoneExpanse'] ?? 0.0;
    sentAt = snapshot.data()['sentAt'] ?? Timestamp.now();
    rentExpense = snapshot.data()['rentExpense'] ?? 0.0;
    rateOrTaxOrCharge = snapshot.data()['rateOrTaxOrCharge'] ?? 0.0;
    personalExpense = snapshot.data()['personalExpense'] ?? 0.0;
    medicalExpense = snapshot.data()['medicalExpense'] ?? 0.0;
    gasExpense = snapshot.data()['gasExpense'] ?? 0.0;
    functionExpense = snapshot.data()['functionExpense'] ?? "";
    electricityExpense = snapshot.data()['electricityExpense'] ?? 0.0;
    educationalExpanse = snapshot.data()['educationalExpanse'] ?? 0.0;
    contributionToFamily = snapshot.data()['contributionToFamily'] ?? 0.0;
    clubExpense = snapshot.data()['clubExpense'] ?? 0.0;
    assetInsuranceOrSecurityExp =
        snapshot.data()['assetInsuranceOrSecurityExp'] ?? 0.0;
  }
}
