import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/chat_controller.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  String userid;
  //SellerShopModel? sellerShopModel;
  String name;

  ChatScreen({
    Key key,
    this.userid,
    // this.sellerShopModel,
    this.name,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController chattextController = TextEditingController();
  // AthenticationController athenticationController =
  //     Get.put(AthenticationController());

  final ScrollController scrollController = ScrollController();

  ChatController chatController = Get.put(ChatController());
  int i;
  @override
  void initState() {
    chatController.chatStream(widget.userid);
    Future.delayed(const Duration(milliseconds: 300));
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });
    i = chatController.getAllchat.length;
    print(i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('Selle name is ${widget.sellerShopModel?.shopeName}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(widget.name),
      ),

      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
              height: 100 * SizeConfig.heightMultiplier,
              //  color: Colors.amber,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80 * SizeConfig.heightMultiplier,
                        child: GetX<ChatController>(
                            init: Get.put(ChatController()),
                            builder: (chatController) {
                              if (chatController.getAllchat.length > 1) {
                                Future.delayed(
                                    const Duration(milliseconds: 300));
                                SchedulerBinding.instance
                                    ?.addPostFrameCallback((_) {
                                  scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(milliseconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                });
                              }
                              return ListView.builder(
                                  reverse: true,
                                  controller: scrollController,
                                  itemCount: chatController.getAllchat.length,
                                  itemBuilder: (context, index) {
                                    if (chatController.getAllchat.length > i) {
                                      Future.delayed(
                                          const Duration(milliseconds: 300));
                                      SchedulerBinding.instance
                                          ?.addPostFrameCallback((_) {
                                        scrollController.animateTo(
                                            scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                const Duration(milliseconds: 1),
                                            curve: Curves.fastOutSlowIn);
                                      });
                                      i = chatController.getAllchat.length;
                                      // print('length i s');
                                    }
                                    return Column(
                                      crossAxisAlignment:
                                          "qZn8U1lBgbOTACtnTG2byEs550v1" ==
                                                  chatController
                                                      .getAllchat[index]
                                                      .senderId
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // height: 8 * SizeConfig.heightMultiplier,
                                          constraints: BoxConstraints(
                                            maxWidth:
                                                80 * SizeConfig.widthMultiplier,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                "qZn8U1lBgbOTACtnTG2byEs550v1" ==
                                                        chatController
                                                            .getAllchat[index]
                                                            .senderId
                                                    ? Colors.blue
                                                    : Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  color: Colors.black12),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            // color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              chatController
                                                  .getAllchat[index].message,
                                              style: TEXT_STYLE_BLACK_COLOR_NORMAL
                                                  .copyWith(
                                                      fontSize: SizeConfig
                                                              .textMultiplier *
                                                          1.8,
                                                      color:
                                                          "qZn8U1lBgbOTACtnTG2byEs550v1" ==
                                                                  chatController
                                                                      .getAllchat[
                                                                          index]
                                                                      .senderId
                                                              ? Colors.white
                                                              : Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              1 * SizeConfig.heightMultiplier,
                                        ),
                                        Text(
                                          DateFormat('h:mm a').format(
                                              chatController
                                                  .getAllchat[index].time
                                                  .toDate()),
                                          style:
                                              TEXT_STYLE_LITE_GREY_COLOR_NORMAL
                                                  .copyWith(
                                                      fontSize: SizeConfig
                                                              .textMultiplier *
                                                          1.3),
                                        )
                                      ],
                                    );
                                  });
                            }),
                      ),
                      SizedBox(
                        height: 2 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 90 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 10, color: Colors.black12),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextField(
                          controller: chattextController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  print(widget.userid);
                                  if (chattextController.text.isNotEmpty) {
                                    chatController
                                        .sendMessage(
                                      userId: widget.userid,
                                      txtMessage: chattextController.text,
                                    )
                                        .then((value) {
                                      chattextController.clear();
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 300));
                                    SchedulerBinding.instance
                                        ?.addPostFrameCallback((_) {
                                      scrollController.animateTo(
                                          scrollController
                                              .position.maxScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.fastOutSlowIn);
                                    });
                                  } else {
                                    print('text is null');
                                  }
                                },
                                child: const Icon(
                                  Icons.send,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          // Positioned(
          //   bottom: 2 * SizeConfig.heightMultiplier,
          //   left: 5 * SizeConfig.widthMultiplier,
          //   child: Center(
          //     child:
          //   ),
          // ),
          //Column(mainAxisAlignment: MainAxisAlignment.center, children: []),
        ],
      ),
    );
  }
}
