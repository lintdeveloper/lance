import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lance/utils/utils.dart';

class CustomPasswordField extends StatefulWidget {

  const CustomPasswordField({
    super.key,
    required this.passwordController,
    required this.hint,
    // required this.validator,
    this.onChanged,
    this.label,
    this.textInputType = TextInputType.text,
    this.focusNode,
    this.isEditable = true,
    this.showSuffixIcon = true,
  });

  final TextEditingController passwordController;
  final String hint;
  final String? label;
  // final String? Function(String?) validator;
  final Function()? onChanged;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool isEditable;
  final bool showSuffixIcon;

  @override
  State<CustomPasswordField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomPasswordField> {
  bool _isValidField = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: LanceColors.textColor,
              fontSize: 14.sp,
            ),
          ),
        if (widget.label != null) SizedBox(height: 8.0.h),
        TextFormField(
          focusNode: widget.focusNode,
          cursorColor: LanceColors.textColor,
          controller: widget.passwordController,
          autocorrect: false,
          enabled: widget.isEditable,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: widget.validator,
          onChanged: (String value) {
            // setState(() {
            //   _isValidField = widget.validator(value) == null;
            // });
            if (widget.onChanged != null) {
              widget.onChanged!();
            }
          },
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            counterText: "",
            suffixIcon: widget.showSuffixIcon
                ? _isValidField
                ? Padding(
              padding: EdgeInsets.all(10.0.w),
              child: SvgPicture.asset('assets/icons/check.svg'),
            )
                : null
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0.w,
                color: LanceColors.borderColor,
              ),
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0.w,
                color: LanceColors.borderColor,
              ),
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0.w,
                color: LanceColors.textColor,
              ),
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0.w,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0.w,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            errorMaxLines: 3,
            contentPadding: EdgeInsets.all(10.0.w),
            errorStyle: const TextStyle(fontFamily: pretendardFonts),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w400,
              color: LanceColors.hintColor,
            ),
          ),
          style: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
            color: LanceColors.textColor,
          ),
        ),
      ],
    );
  }
}
