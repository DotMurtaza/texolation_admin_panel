import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  String id;
  Timestamp sentAt;
  String cnic;
  String phoneNo;
  String emailId;
  String password;
  String firstName;
  String lastName;
  String otherPhoneNo;
  String userGender;
  String dateOfBirth;
  String currentAddress;
  String currentCountry;
  String currentState;
  String currentCity;
  String foreignAddress;
  String foreignCountry;
  bool isTaxPaying;
  String foreignState;
  String foreignCity;
  String permanentAddress;
  String permanentCountry;
  String permanentState;
  String permanentCity;
  String businessAddress;
  String businessCountry;
  String businessState;
  String businessCity;
  String propertyType;
  String sourceOfIncome;
  String regWithFBR;
  String remPasswordNTN;
  String passwordNTN;
  String residentialStatus;
  String fillingYear;
  double taxPaid;

  UserProfileModel({
    this.isTaxPaying,
    this.id,
    this.sentAt,
    this.cnic,
    this.phoneNo,
    this.emailId,
    this.password,
    this.firstName,
    this.lastName,
    this.otherPhoneNo,
    this.userGender,
    this.dateOfBirth,
    this.currentAddress,
    this.currentCountry,
    this.currentState,
    this.currentCity,
    this.foreignAddress,
    this.foreignCountry,
    this.foreignState,
    this.foreignCity,
    this.permanentAddress,
    this.permanentCountry,
    this.permanentState,
    this.permanentCity,
    this.businessAddress,
    this.businessCountry,
    this.businessState,
    this.businessCity,
    this.sourceOfIncome,
    this.propertyType,
    this.regWithFBR,
    this.remPasswordNTN,
    this.passwordNTN,
    this.residentialStatus,
    this.fillingYear,
  });

  UserProfileModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id ?? "";
    // sentAt = snapshot.data()['sentAt'] ?? "";
    isTaxPaying = snapshot.data()['isTaxPaying'] ?? false;
    cnic = snapshot.data()['cnic'] ?? "";
    phoneNo = snapshot.data()['phoneNo'] ?? "";
    emailId = snapshot.data()['emailId'] ?? "";
    password = snapshot.data()['password'] ?? "";
    firstName = snapshot.data()['firstName'] ?? "";
    lastName = snapshot.data()['lastName'] ?? "";
    otherPhoneNo = snapshot.data()['otherPhoneNo'] ?? "";
    userGender = snapshot.data()['userGender'] ?? "";
    dateOfBirth = snapshot.data()['dateOfBirth'] ?? "";
    currentAddress = snapshot.data()['currentAddress'] ?? "";
    currentCountry = snapshot.data()['currentCountry'] ?? "";
    currentState = snapshot.data()['currentState'] ?? "";
    currentCity = snapshot.data()['currentCity'] ?? "";
    foreignAddress = snapshot.data()['foreignAddress'] ?? "";
    foreignCountry = snapshot.data()['foreignCountry'] ?? "";
    foreignState = snapshot.data()['foreignState'] ?? "";
    foreignCity = snapshot.data()['foreignCity'] ?? "";
    permanentAddress = snapshot.data()['permanentAddress'] ?? "";
    permanentCountry = snapshot.data()['permanentCountry'] ?? "";
    permanentState = snapshot.data()['permanentState'] ?? "";
    permanentCity = snapshot.data()['permanentCity'] ?? "";
    businessAddress = snapshot.data()['businessAddress'] ?? "";
    businessCountry = snapshot.data()['businessCountry'] ?? "";
    businessState = snapshot.data()['businessState'] ?? "";
    businessCity = snapshot.data()['businessCity'] ?? "";
    propertyType = snapshot.data()['propertyType'] ?? "";
    sourceOfIncome = snapshot.data()['sourceOfIncome'] ?? "";
    regWithFBR = snapshot.data()['regWithFBR'] ?? "";
    remPasswordNTN = snapshot.data()['remPasswordNTN'] ?? "";
    passwordNTN = snapshot.data()['passwordNTN'] ?? "";
    residentialStatus = snapshot.data()['residentialStatus'] ?? "";
    fillingYear = snapshot.data()['fillingYear'] ?? "";
    sentAt = snapshot.data()['sentAt'] ?? "";
    print('First name is: $firstName');
  }
}
