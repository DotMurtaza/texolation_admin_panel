// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:taxolution_admin/Utils/show-dialoag.dart';

// class AuthScreenValidationController extends GetxController {
//   final firebaseFirestore = FirebaseFirestore.instance;
//   RxBool checkBoxValueAuthScreen = false.obs;
//   RxBool checkBoxValueTermsCondition = false.obs;
//   FirebaseAuth auth = FirebaseAuth.instance;

//   RxString docId;
//   TextEditingController cnicSignUp = TextEditingController();
//   TextEditingController phoneSignUp = TextEditingController();
//   TextEditingController emailSignUp = TextEditingController();
//   TextEditingController passwordSignUp = TextEditingController();
//   TextEditingController cnicSignIn = TextEditingController();
//   TextEditingController emailSignIn = TextEditingController();
//   TextEditingController passwordSignIn = TextEditingController();
//   TextEditingController adminController = TextEditingController();
//   // final auth = FirebaseAuth.instance;

//   void signInValidation({signInScreenFormKey}) {
//     if (adminController.text == "admin@123") {
//       Get.to(() => AdminWelcome());
//       adminController.clear();
//     } else {
//       final isValid = signInScreenFormKey.currentState.validate();
//       if (!isValid) {
//         return;
//       }
//       signInScreenFormKey.currentState.save();
//       signIn(emailSignIn.text, passwordSignIn.text);
//       checkBoxValueAuthScreen(false);
//     }
//   }

//   signIn(String email, String password) {
//     try {
//       showLoading();
//       auth
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then((value) {
//         Get.snackbar('Success', 'Your are login now!');
//         Get.to(OnBoardingPage());
//       });
//     } catch (e) {
//       print(e);
//       Get.snackbar('Error', e.toString());
//     }
//   }

//   void forgetValidation({forgetScreenFormKey}) {
//     final isValid = forgetScreenFormKey.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//     forgetScreenFormKey.currentState.save();
//     Get.to(SignInPage());
//     checkBoxValueAuthScreen(false);
//   }

//   //Sign up

//   void signUpValidation({signInScreenFormKey}) {
//     final isValid = signInScreenFormKey.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//     signUp(emailSignUp.text, passwordSignUp.text);

//     signInScreenFormKey.currentState.save();

//     checkBoxValueAuthScreen(false);
//   }

//   signUp(String email, String password) {
//     try {
//       showLoading();
//       auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) {
//         Get.snackbar('Success', 'Account Created Successfully');
//         Get.to(OnBoardingPage());
//         addData(cnicSignUp.text, phoneSignUp.text, email, password);
//       });
//     } catch (e) {
//       print(e);
//       Get.snackbar('Error', e.toString());
//     }
//   }

//   //LogOut

//   void logOut() {
//     auth.signOut().then((value) => Get.to(SignInPage()));
//   }

//   //Firestore collection
//   Future<void> addData(
//     String cnic,
//     String phoneNo,
//     String emailId,
//     String password,
//   ) async {
//     try {
//       await firebaseFirestore
//           .collection('UserProfile')
//           .doc(auth.currentUser.uid)
//           .set({
//         'sentAt': Timestamp.now(),
//         'cnic': cnic,
//         'phoneNo': phoneNo,
//         'emailId': emailId,
//         'password': password,
//         'firstName': '',
//         'isTaxPaying': false,
//         'lastName': '',
//         'otherPhoneNo': '',
//         'userGender': '',
//         'dateOfBirth': '',
//         'currentAddress': '',
//         'currentCountry': '',
//         'currentState': '',
//         'currentCity': '',
//         'foreignAddress': '',
//         'foreignCountry': '',
//         'foreignState': '',
//         'foreignCity': '',
//         'permanentAddress': '',
//         'permanentCountry': '',
//         'permanentState': '',
//         'permanentCity': '',
//         'businessAddress': '',
//         'businessCountry': '',
//         'businessState': '',
//         'businessCity': '',
//         'propertyType': '',
//         'sourceOfIncome': '',
//         'regWithFBR': '',
//         'remPasswordNTN': '',
//         'passwordNTN': '',
//         'residentialStatus': '',
//         'fillingYear': '',
//       }).then((value) {
//         firebaseFirestore.collection('UserProfile').doc(auth.currentUser.uid);
//         docId = auth.currentUser.uid.obs;
//         //clearField();
//         print('New Id: $docId');
//       });
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }

// //update payment value

//   Future<void> updatePayment(bool value) {
//     return firebaseFirestore
//         .collection('UserProfile')
//         .doc(auth.currentUser.uid)
//         .update({'isTaxPaying': value});
//   }
// }
