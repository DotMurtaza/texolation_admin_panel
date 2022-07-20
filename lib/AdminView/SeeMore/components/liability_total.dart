import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_assetsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalLiability extends StatelessWidget {
  const TotalLiability({Key key, this.liability}) : super(key: key);
  final int liability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Liability"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Amount :",
              style: TEXT_STYLE_BLACK_COLOR_W500,
            ),
            GetX<UserAssetsController>(
                init: Get.put<UserAssetsController>(UserAssetsController()),
                builder: (UserAssetsController expenController) {
                  if (expenController != null &&
                      expenController.laibility != null) {
                    var exp = expenController.laibility[0];
                    return Text(
                      '$liability',
                      style: TEXT_STYLE_BLACK_COLOR_W700,
                    );
                  } else {
                    return Text(
                      'loading...',
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
