import 'package:admin_taxolution/Models/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<UserProfileModel> userModel = UserProfileModel().obs;

  UserProfileModel get user => userModel.value;

  set user(UserProfileModel value) => this.userModel.value = value;

  FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get users => _firebaseUser.value;
  String get newUser => _firebaseUser.value?.email;

  @override
  onInit() async {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  getUser() async {
    try {
      print('Uid is here : ${users.uid}');
      DocumentSnapshot doc = await firebaseFirestore
          .collection('UserProfile')
          .doc(users.uid)
          .get();
      user = UserProfileModel.fromSnapshot(doc);
      // return UserProfileModel.fromSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
