import 'package:flutter/material.dart';
import 'package:ramf2_app/core/resources/border_radius_manager.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/padding_manager.dart';
import 'package:ramf2_app/core/resources/width_values.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    required this.validator,
    this.suffixIcon,
    this.onChanged,
    required this.keyboardType,
    this.hintText,
    this.onTap,
    this.maxLength,
    this.colorText = ColorsManager.kLight2Black,
    this.textFontSize = FontsSize.f14,
    this.label,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final Widget? suffixIcon;
  final Color? colorText;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final String? hintText;
  final int? maxLength;
  final bool enabled;
  final Widget? label;
  final double textFontSize;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(BorderRadiusValue.br12),
      color: Colors.transparent,
      // shadowColor: Colors.black,
      //
      // elevation: 50,

      child: TextFormField(
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        textAlign: TextAlign.center,
        readOnly: readOnly,
        enabled: enabled,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscuringCharacter: "*",
        validator: validator,
        style: TextStyle(
            color: colorText,
            // fontSize: textFontSize,
            letterSpacing: 2,
            fontWeight: FontWeight.bold),
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: ColorsManager.kGrey1.withOpacity(.5)),
            label: label,
            suffixIcon: suffixIcon,
            isDense: true,
            // contentPadding: EdgeInsets.zero,
            contentPadding: const EdgeInsets.symmetric(
                vertical: PaddingValues.p8, horizontal: PaddingValues.p8),
            filled: true,
            fillColor: ColorsManager.kWhiteColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(BorderRadiusValue.br50),
                borderSide: const BorderSide(
                    color: ColorsManager.kBlueColor, width: WidthValues.w1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(BorderRadiusValue.br50),
                borderSide: const BorderSide(
                    color: ColorsManager.kRed, width: WidthValues.w1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(BorderRadiusValue.br50),
                borderSide: BorderSide(
                    color: ColorsManager.kGrey1.withOpacity(.5),
                    width: WidthValues.w1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(BorderRadiusValue.br50),
                borderSide: BorderSide(
                    color: ColorsManager.kGrey1.withOpacity(.5),
                    width: WidthValues.w1))),
      ),
    );
  }
}
