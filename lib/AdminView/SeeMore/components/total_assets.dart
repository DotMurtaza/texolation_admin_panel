import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/user_assetsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalAssets extends StatefulWidget {
  const TotalAssets(
      {Key key,
      this.property,
      this.otherAssets,
      this.motor,
      this.bank,
      this.capital,
      this.foriegn,
      this.machinery})
      : super(key: key);
  final int property;
  final int otherAssets;
  final int motor;
  final int bank;
  final int capital;
  final int foriegn;
  final int machinery;

  @override
  State<TotalAssets> createState() => _TotalAssetsState();
}

class _TotalAssetsState extends State<TotalAssets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Assets"),
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
                builder: (UserAssetsController assetController) {
                  if (assetController != null &&
                      assetController.requireAssetLibility != null) {
                    var exp = assetController.requireAssetLibility[0];
                    return Text(
                      '${double.parse(exp.cashInHand) + widget.property + widget.otherAssets + widget.motor + widget.bank + widget.capital + widget.foriegn + widget.machinery}',
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
