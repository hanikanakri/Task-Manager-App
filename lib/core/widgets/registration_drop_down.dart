import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/dropdown_textfield.dart';

class CustomDropDown_2 extends StatelessWidget {
  const CustomDropDown_2(
      {super.key,
      required this.values,
      this.validationText,
      this.hintStyle,
      this.hintText,
      this.labelText,
      this.initialValue,
      this.isEnabled = true,
      this.onValidate,
      this.onChangeSelectedItem,
      this.controller,
      this.isMaxWidthSize = true,
      this.hasPadding,
      this.inputDecoration,
      this.enableSearch});
  final List<DropDownValueModel> values;
  final InputDecoration? inputDecoration;
  final initialValue;
  final String? validationText;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final bool isEnabled;
  final Function(String)? onValidate;
  final Function(dynamic)? onChangeSelectedItem;
  final dynamic controller;
  final bool? isMaxWidthSize;
  final bool? hasPadding;
  final bool? enableSearch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:65,
      width: isMaxWidthSize! ? double.infinity : 300,
      child: DropDownTextField(
        initialValue: initialValue,
        onChanged: onChangeSelectedItem,
        controller: controller,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        isEnabled: isEnabled,
        validator: (value) {
          if (value != null && onValidate != null) {
            onValidate!(value);
          }
          return value == null || value.isEmpty ? validationText : null;
        },
        dropDownIconProperty: IconProperty(icon: Icons.expand_more),
        searchDecoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        textFieldDecoration: inputDecoration ??
            InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.mainGrayColor, width: 0.0),
                borderRadius: BorderRadius.circular(18),
              ),
              labelText: labelText,
              hintText: hintText?.tr(),
              labelStyle: AppTheme.bodyText1,
              hintStyle: hintStyle ??
                  AppTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.w200, color: AppColors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.0),
                borderRadius: BorderRadius.circular(12),
              ),
              fillColor: AppColors.mainGrayColor,
            ),
        enableSearch: enableSearch ?? false,
        dropDownList: values,
      ),
    );
  }
}
