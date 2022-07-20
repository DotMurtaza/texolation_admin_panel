import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key key,
    this.hint,
    this.list,
    this.validate,
    this.selected,
    this.isBackend = false,
    this.chosenValues,
    this.dropDownValue,
  }) : super(key: key);

  final String hint;
  final list;
  final String Function(String) validate;
  final Function(String) selected;
  final bool isBackend;
  final String dropDownValue;
  String chosenValues;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

//final productController = Get.put(ProductController());

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6 * SizeConfig.heightMultiplier,
      width: 86 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          value: widget.isBackend == true
              ? widget.dropDownValue
              : widget.chosenValues,
          //elevation: 5,
          style: Theme.of(context).textTheme.subtitle2,
          validator: widget.validate,
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(value),
              ),
            );
          }).toList(),
          isExpanded: true,
          elevation: 16,
          hint: Text(widget.hint, style: TEXT_STYLE_BLACK_COLOR_NORMAL),
          onChanged: (String value) {
            setState(() {
              widget.chosenValues = value;

              widget.selected(widget.chosenValues);
              print(widget.selected(widget.chosenValues));
            });
          },
        ),
      ),
    );
  }
}
