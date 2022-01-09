import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visual_notes/core/localization/app_localization.dart';
import 'package:visual_notes/core/styles/app_colors.dart';
import 'package:visual_notes/core/styles/sizes.dart';
import 'package:visual_notes/core/widgets/custom_text.dart';
import 'package:visual_notes/core/widgets/custom_text_field.dart';

class AddNoteTextFieldComponent extends StatelessWidget {
  final String title;
  final String hint;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;
  final bool isMultiLine;
  final int maxLines;

  const AddNoteTextFieldComponent({
    required this.title,
    required this.hint,
    this.initialValue,
    this.controller,
    required this.validator,
    this.onSaved,
    this.keyboardType,
    this.isMultiLine = false,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.h4(
          context,
          title,
          color: context.textTheme.headline5!.color,
          padding: AppLocalizations.instance.isAr()
              ? EdgeInsets.only(right: Sizes.hPaddingTiny)
              : EdgeInsets.only(left: Sizes.hPaddingTiny),
        ),
        SizedBox(
          height: Sizes.vPaddingSmallest,
        ),
        CustomTextField(
          controller: controller,
          validationColor: AppColors.primaryColor,
          textInputAction:
              isMultiLine ? TextInputAction.newline : TextInputAction.next,
          keyboardType: keyboardType,
          maxLines: maxLines,
          initialValue: initialValue,
          validator: validator,
          onSaved: onSaved,
          margin: EdgeInsets.only(
            bottom: Sizes.textFieldVMarginMedium,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: Sizes.textFieldVPaddingMedium,
            horizontal: Sizes.textFieldHPaddingMedium,
          ),
          fillColor: Colors.transparent,
          hintText: hint,
          key: ValueKey(title),
        ),
      ],
    );
  }
}
