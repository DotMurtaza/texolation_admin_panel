import 'dart:io';

import 'package:admin_taxolution/Models/cnic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import 'Auth_Screen_Controller.dart';

class CNICController extends GetxController {
  File imageFront;
  File imageBack;
  RxBool isFront = false.obs;
  RxBool isBack = false.obs;
  final firebaseFirestore = FirebaseFirestore.instance;
  // AuthScreenValidationController authScreenValidationController =
  //     Get.put(AuthScreenValidationController());
  Rx<CNICModel> cnicModel = CNICModel().obs;

  CNICModel get cnic => cnicModel.value;

  set cnic(CNICModel value) => this.cnicModel.value = value;

  getCNICImages(id) async {
    try {
      // print('Uid is here : ${users.uid}');
      DocumentSnapshot doc = await firebaseFirestore
          .collection('UserProfile')
          .doc(id)
          .collection('CNICImages')
          .doc('CNIC')
          .get();
      cnic = CNICModel.fromSnapshot(doc);
      // return UserProfileModel.fromSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  // Future<bool> uploadCNICImages() async {
  //   try {
  //     final ref1 = FirebaseStorage.instance
  //         .ref()
  //         .child('CNIC-images')
  //         .child('${authScreenValidationController.auth.currentUser.uid}')
  //         .child('front_side');
  //     final ref2 = FirebaseStorage.instance
  //         .ref()
  //         .child('CNIC-images')
  //         .child('${authScreenValidationController.auth.currentUser.uid}')
  //         .child('back_side');
  //     await ref1.putFile(imageFront);
  //     await ref2.putFile(imageBack);

  //     final url1 = await ref1.getDownloadURL();
  //     final url2 = await ref2.getDownloadURL();
  //     await firebaseFirestore
  //         .collection('UserProfile')
  //         .doc(authScreenValidationController.auth.currentUser.uid)
  //         .collection('CNICImages')
  //         .doc('CNIC')
  //         .set({
  //       'image-front': url1,
  //       'image-back': url2,
  //     }).then((value) {
  //       imageFront = null;
  //       imageBack = null;
  //       Get.to(PaymentMethodScreen());
  //     });
  //     Get.back();
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar('Error', e.toString());
  //     return false;
  //   }
  // }
}
