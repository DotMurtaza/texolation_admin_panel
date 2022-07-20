import 'package:admin_taxolution/AdminView/Chat/alluser_for_chat.dart';
import 'package:admin_taxolution/AdminView/SeeMore/admin_login.dart';
import 'package:admin_taxolution/AdminView/user_details.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/all_user_controller.dart';
import 'package:admin_taxolution/Controller/user_income_informationController.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({Key key}) : super(key: key);

  @override
  _AdminMainState createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  // @override
  // void initState() {
  //   Get.put(UserAssetsController());
  //   super.initState();
  // }

  // final referal_controller = Get.put(ReferalController());
  TextEditingController searchController = new TextEditingController();
  final incomeInfoController = Get.put(UserIncomeInformationController());
  RxBool isSearch = false.obs;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tax Not Paying",
                    style: TEXT_STYLE_WHITE_COLOR_NORMAL,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tax Paying",
                    style: TEXT_STYLE_WHITE_COLOR_NORMAL,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    isSearch.value = !isSearch.value;
                    //  FocusScope.of(context).requestFocus(focusNode);
                    //setState(() {});
                    print(isSearch.value);
                  },
                  icon: Icon(CupertinoIcons.search))
            ],
            //  backgroundColor: bgColor,
            title: Obx(
              () => isSearch.value == false
                  ? Text('All User')
                  : Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        controller: searchController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20)),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
            ),
            centerTitle: false,
          ),
          drawer: MyDrawer(),
          body: TabBarView(children: [
            GetX<AllUserController>(
                init: Get.put<AllUserController>(AllUserController()),
                builder: (AllUserController allUserController) {
                  if (allUserController != null &&
                      allUserController.allUser != null) {
                    return Container(
                      height: SizeConfig.heightMultiplier * 90,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: allUserController.allUser.length,
                          itemBuilder: (context, index) {
                            final DateFormat formatter =
                                DateFormat('yyyy-MM-dd');
                            var date = formatter.format(
                                DateTime.fromMicrosecondsSinceEpoch(
                                    allUserController.allUser[index].sentAt
                                        .microsecondsSinceEpoch));

                            return allUserController.allUser[index].cnic
                                    .contains(searchController.text)
                                ? Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: Text(allUserController
                                            .allUser[index]
                                            .emailId
                                            .characters
                                            .first
                                            .toUpperCase()
                                            .toString()),
                                      ),
                                      title: Text(
                                          '${allUserController.allUser[index].cnic}'),
                                      subtitle: Text(allUserController
                                          .allUser[index].emailId),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Join Date'),
                                          Text('${date}')
                                          //           0
                                          //       ? '\$ ${allUserController.allUser[index].investmentAmount}'
                                          //       : '\$ 0',
                                          //   style:
                                          //       TextStyle(fontWeight: FontWeight.bold),
                                          // ),
                                        ],
                                      ),
                                      onTap: () {
                                        Get.to(UserDetails(
                                          users:
                                              allUserController.allUser[index],
                                        ));
                                        // referal_controller.getRef(
                                        //     allUserController.allUser[index].id);
                                        // Get.to(UserDetailWidget(
                                        //     allUserData:
                                        //         allUserController.allUser[index]));
                                      },
                                    ))
                                : Container();
                          }),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'User Loading...',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }
                }),
            GetX<AllUserController>(
                init: Get.put<AllUserController>(AllUserController()),
                builder: (AllUserController allUserController) {
                  if (allUserController != null &&
                      allUserController.allUserTaxPaying != null) {
                    return Container(
                      height: SizeConfig.heightMultiplier * 90,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: allUserController.allUserTaxPaying.length,
                          itemBuilder: (context, index) {
                            final DateFormat formatter =
                                DateFormat('yyyy-MM-dd');
                            var date = formatter.format(
                                DateTime.fromMicrosecondsSinceEpoch(
                                    allUserController.allUserTaxPaying[index]
                                        .sentAt.microsecondsSinceEpoch));

                            return allUserController
                                    .allUserTaxPaying[index].cnic
                                    .contains(searchController.text)
                                ? Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: Text(allUserController
                                            .allUserTaxPaying[index]
                                            .emailId
                                            .characters
                                            .first
                                            .toUpperCase()
                                            .toString()),
                                      ),
                                      title: Text(
                                          '${allUserController.allUserTaxPaying[index].cnic}'),
                                      subtitle: Text(allUserController
                                          .allUserTaxPaying[index].emailId),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Join Date'),
                                          Text('${date}')
                                          //           0
                                          //       ? '\$ ${allUserController.allUser[index].investmentAmount}'
                                          //       : '\$ 0',
                                          //   style:
                                          //       TextStyle(fontWeight: FontWeight.bold),
                                          // ),
                                        ],
                                      ),
                                      onTap: () {
                                        Get.to(UserDetails(
                                          users: allUserController
                                              .allUserTaxPaying[index],
                                        ));
                                        // referal_controller.getRef(
                                        //     allUserController.allUser[index].id);
                                        // Get.to(UserDetailWidget(
                                        //     allUserData:
                                        //         allUserController.allUser[index]));
                                      },
                                    ))
                                : Container();
                          }),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'User Loading...',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }
                })
          ])),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: const Text(
            'Admin',
            style: TextStyle(color: Colors.black),
          ),
          accountEmail:
              const Text('Admin@123', style: TextStyle(color: Colors.black)),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/admin.png'),
          ),
          otherAccountsPictures: const <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white60,
              child: Text('A'),
            ),
            CircleAvatar(
              child: Text('R'),
            ),
          ],
          onDetailsPressed: () {},
        ),
        ListTile(
          title: const Text('Chats'),
          leading: const Icon(CupertinoIcons.chat_bubble_text),
          onTap: () {
            print("hiii");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AllUserforChat()));
          },
        ),

        // ListTile(
        //   title: const Text('Calls'),
        //   leading: const Icon(Icons.call),
        //   onLongPress: () {},
        // ),
        //  const Divider(),
        // ListTile(
        //   title: const Text('Settings'),
        //   leading: const Icon(Icons.settings),
        //   onLongPress: () {},
        // ),
        const Divider(),
        ListTile(
          title: const Text('LogOut'),
          leading: const Icon(Icons.logout),
          onTap: () {
            FirebaseAuth.instance
                .signOut()
                .then((value) => Get.offAll(LoginDemo()));
          },
        ),
        ListTile(
            title: const Text('Close'),
            leading: const Icon(Icons.close),
            onTap: () {
              Navigator.of(context).pop();
            }),
      ]),
    );
  }
}
