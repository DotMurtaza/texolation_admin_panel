import 'package:admin_taxolution/Constant/Color.dart';
import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final int textFieldSize;
  final String isSuffixIconShow;
  final String keyBoardType;
  final Function onIconTap;
  final Function onTapValidation;
  final Function onTap;
  bool readOnly;

  final TextEditingController controller;
  InputField(
      {this.readOnly = false,
      this.textFieldSize,
      this.labelText,
      this.controller,
      this.isSuffixIconShow,
      this.onTapValidation,
      this.onIconTap,
      this.keyBoardType,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 20, left: 0),
      child: Container(
        height: SizeConfig.heightMultiplier * 6.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: WHITE_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: LITE_GREY_COLOR.withOpacity(.5),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5),
          child: TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            keyboardType: keyBoardType == "number"
                ? TextInputType.number
                : keyBoardType == "text"
                    ? TextInputType.text
                    : TextInputType.text,
            cursorColor: BLACK_COLOR,
            validator: onTapValidation,
            textInputAction: TextInputAction.next,
            controller: controller,
            style: TEXT_STYLE_BLACK_COLOR_NORMAL,
            decoration: textFieldSize == 1
                ? InputDecoration(
                    hintText: labelText,
                    fillColor: WHITE_COLOR,
                    suffixIcon: isSuffixIconShow == "true"
                        ? GestureDetector(
                            onTap: onIconTap,
                            child: const Icon(
                              Icons.calendar_today_outlined,
                            ),
                          )
                        : SizedBox(),
                    hintStyle: TEXT_STYLE_BLACK_COLOR_NORMAL,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,

                    /*  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                      //  borderSide: BorderSide(color: LITE_GREY_COLOR.withOpacity(1)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                    ),*/
                  )
                : InputDecoration(
                    hintText: labelText,
                    fillColor: WHITE_COLOR,
                    hintStyle: TEXT_STYLE_BLACK_COLOR_NORMAL,
                    suffixIcon: isSuffixIconShow == "true"
                        ? GestureDetector(
                            onTap: onIconTap,
                            child: const Icon(
                              Icons.calendar_today_outlined,
                            ),
                          )
                        : SizedBox(),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,

                    /* border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                      //  borderSide: BorderSide(color: LITE_GREY_COLOR.withOpacity(1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                      //  borderSide: BorderSide(color: LITE_GREY_COLOR.withOpacity(1)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MEDIUM_GREEN_COLOR),
                    ),*/
                  ),
          ),
        ),
      ),
    );
  }
}
