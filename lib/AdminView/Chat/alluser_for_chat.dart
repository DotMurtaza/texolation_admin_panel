import 'package:admin_taxolution/AdminView/Chat/chat_screen.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/chat_controller.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AllUserforChat extends StatelessWidget {
  AllUserforChat({Key key}) : super(key: key);
  ChatController chatController = Get.put(ChatController());
  // SellerShopModel sellerShopModel = SellerShopModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user chat '),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                GetX<ChatController>(
                    init: Get.put(ChatController()),
                    builder: (chatController) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: chatController.getAlluserForchat.length,
                          itemBuilder: (context, index) {
                            print(
                                "lenght :${chatController.getAlluserForchat.length}");
                            return SizedBox(
                              height: 10 * SizeConfig.heightMultiplier,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ChatScreen(
                                        userid: chatController
                                            .getAlluserForchat[index].id,
                                        name: chatController
                                            .getAlluserForchat[index]
                                            .sellerName,
                                      ));
                                },
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  margin: const EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          child: Text(chatController
                                              .getAlluserForchat[index].email[0]
                                              .toUpperCase()),
                                        ),
                                        SizedBox(
                                          width: 5 * SizeConfig.widthMultiplier,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              chatController
                                                  .getAlluserForchat[index]
                                                  .sellerName,
                                              style:
                                                  TEXT_STYLE_BLACK_COLOR_W500,
                                            ),
                                            Text(
                                              chatController
                                                  .getAlluserForchat[index]
                                                  .email,
                                              style: TEXT_STYLE_LITE_GREY_COLOR_NORMAL
                                                  .copyWith(
                                                      fontSize: SizeConfig
                                                              .textMultiplier *
                                                          1.4),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
