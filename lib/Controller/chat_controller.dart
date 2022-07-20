import 'package:admin_taxolution/Models/chat_model.dart';
import 'package:admin_taxolution/Models/user_chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

var firebaseFirestore = FirebaseFirestore.instance;

class ChatController extends GetxController {
  @override
  void onInit() {
    alluserForchat.bindStream((getUserforChat()));
    super.onInit();
  }

  // AuthScreenValidationController athenticationController =
  //     Get.put(AuthScreenValidationController());

  Rx<List<UserchatModel>> alluserForchat = Rx<List<UserchatModel>>([]);
  List<UserchatModel> get getAlluserForchat => alluserForchat.value;

  Rx<List<ChatModel>> allchat = Rx<List<ChatModel>>([]);
  List<ChatModel> get getAllchat => allchat.value;
  void chatStream(String uid) {
    allchat.bindStream(getChatStream(uid));
  }

  Stream<List<ChatModel>> getChatStream(String uid) {
    return firebaseFirestore
        .collection('UserProfile')
        .doc(uid)
        .collection('Chat')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChatModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(ChatModel.fromSnapshot(element));
      }
      print(' chat model legth is ${retVal.length}');

      return retVal;
    });
  }

  Stream<List<UserchatModel>> getUserforChat() {
    return firebaseFirestore
        .collection('Admin')
        .doc("qZn8U1lBgbOTACtnTG2byEs550v1")
        .collection('AllUser')
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserchatModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(UserchatModel.fromSnapshot(element));
      }
      print('User chat model legth is ${retVal.length}');

      return retVal;
    });
  }

  Future<void> sendMessage({
    String userId,
    String txtMessage,
  }) async {
    print('text message $txtMessage');
    firebaseFirestore
        .collection('UserProfile')
        .doc(userId)
        .collection('Chat')
        .add({
      'message': txtMessage,
      'senderId': "qZn8U1lBgbOTACtnTG2byEs550v1",
      'dateTime': DateTime.now()
    }).then((value) {
      firebaseFirestore
          .collection('Admin')
          .doc("qZn8U1lBgbOTACtnTG2byEs550v1")
          .collection('AllUser')
          .doc(userId)
          .collection('Allchat')
          .add({
        'message': txtMessage,
        'senderId': "qZn8U1lBgbOTACtnTG2byEs550v1",
        'dateTime': DateTime.now()
      });
    });
  }

  // void sendMessage(
  //     String txtMessage, String sellerId, SellerShopModel sellerShopModel) {
  //   print('seller name is ${sellerShopModel.sellerName}');
  //   print('shop Image ${sellerShopModel.image}');
  //   print('${athenticationController.auth.currentUser?.uid}');
  //   athenticationController.firebaseFirestore
  //       .collection('Buyer')
  //       .doc(athenticationController.auth.currentUser?.uid)
  //       .collection('AllSeller')
  //       .doc(sellerId)
  //       .set({
  //     'sellerName': sellerShopModel.sellerName,
  //     'imageUrl': sellerShopModel.image,
  //   }).then((value) {
  //     athenticationController.firebaseFirestore
  //         .collection('Buyer')
  //         .doc(athenticationController.auth.currentUser?.uid)
  //         .collection('AllSeller')
  //         .doc(sellerId)
  //         .collection('Allchat')
  //         .add({
  //       'message': txtMessage,
  //       'senderId': athenticationController.auth.currentUser?.uid
  //     }).then((value) {
  //       athenticationController.firebaseFirestore
  //           .collection('Seller')
  //           .doc(sellerId)
  //           .collection('AllBuyer')
  //           .doc(athenticationController.auth.currentUser?.uid)
  //           .set({
  //         'buyerName': athenticationController.getuser.name,
  //         'imageUrl': athenticationController.getuser.image,
  //       }).then((value) {
  //         athenticationController.firebaseFirestore
  //             .collection('Seller')
  //             .doc(sellerId)
  //             .collection('AllBuyer')
  //             .doc(athenticationController.auth.currentUser?.uid)
  //             .collection('Allchat')
  //             .add({
  //           'message': txtMessage,
  //           'senderId': athenticationController.auth.currentUser?.uid,
  //         }).then((value) {
  //           print('message send');
  //         });
  //       });
  //     });
  //   });
  // }
}
