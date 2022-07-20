import 'package:admin_taxolution/Constant/Color.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isButtonSizeLarge;
  final Color textClr;
  final Function onTap;

  CustomButton({
    this.title,
    this.textClr,
    this.onTap,
    this.isButtonSizeLarge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isButtonSizeLarge == true
            ? SizeConfig.widthMultiplier * 80
            : SizeConfig.widthMultiplier * 40,
        height: isButtonSizeLarge == true
            ? SizeConfig.heightMultiplier * 7.5
            : SizeConfig.heightMultiplier * 7.5,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                LITE_BLUE_COLOR,
                LITE_BLUE_COLOR,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: LITE_GREY_COLOR, // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(title,
              textAlign: TextAlign.center,
              style: TEXT_STYLE_WHITE_COLOR_NORMAL.copyWith(
                  fontSize: SizeConfig.textMultiplier * 2.7)),
        ),
      ),
    );
  }
}
