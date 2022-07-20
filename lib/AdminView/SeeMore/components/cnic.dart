import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/CINCController.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CNICWidget extends StatelessWidget {
  const CNICWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CNICController>(
        init: Get.put<CNICController>(CNICController()),
        builder: (CNICController cnicsController) {
          if (cnicsController != null && cnicsController.cnic != null) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Front Side',
                    style: TEXT_STYLE_BLACK_COLOR_W600,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.5),
                        borderRadius: BorderRadius.circular(12)),
                    width: SizeConfig.widthMultiplier * 95,
                    height: SizeConfig.heightMultiplier * 25,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        cnicsController.cnic.frontSide,
                        fit: BoxFit.cover,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Back Side',
                    style: TEXT_STYLE_BLACK_COLOR_W600,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.5),
                        borderRadius: BorderRadius.circular(12)),
                    width: SizeConfig.widthMultiplier * 95,
                    height: SizeConfig.heightMultiplier * 25,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        cnicsController.cnic.backSide,
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
