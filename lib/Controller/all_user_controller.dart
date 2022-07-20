import 'package:admin_taxolution/Models/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllUserController extends GetxController {
  Rx<List<UserProfileModel>> allUserList = Rx<List<UserProfileModel>>();
  List<UserProfileModel> get allUser => allUserList.value;
  Rx<List<UserProfileModel>> allUserListTaxPaying =
      Rx<List<UserProfileModel>>();
  List<UserProfileModel> get allUserTaxPaying => allUserListTaxPaying.value;
  //final authController = Get.put(AuthScreenValidationController());
  @override
  void onInit() {
    allUserList.bindStream(allUserStream(false));
    allUserListTaxPaying.bindStream(allUserStream(true));
    super.onInit();
  }

  Stream<List<UserProfileModel>> allUserStream(bool value) {
    print("enter in all user stream funtion");
    return FirebaseFirestore.instance
        .collection('UserProfile')
        .where('isTaxPaying', isEqualTo: value)
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserProfileModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(UserProfileModel.fromSnapshot(element));
      });

      print('lenght of all users is ${retVal.length}');
      return retVal;
    });
  }
  // Stream<List<UserProfileModel>> allUserStream() {
  //   print("enter in all user stream funtion");
  //   return FirebaseFirestore.instance
  //       .collection('UserProfile')
  //       .doc(authController.auth.currentUser.uid)
  //       .collection('collectionPath')
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<UserProfileModel> retVal = List();
  //     query.docs.forEach((element) {
  //       retVal.add(UserProfileModel.fromSnapshot(element));
  //     });

  //     print('lenght of all users is ${retVal.length}');
  //     return retVal;
  //   });
  // }
}
