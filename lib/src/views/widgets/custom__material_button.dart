import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lance/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class CustomMaterialButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final bool isDisabled;

  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || isDisabled ? () {} : onPressed,
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0.r),
          color: isDisabled ? LanceColors.hintColor : LanceColors.secondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              LoadingAnimationWidget.discreteCircle(
                color: LanceColors.primaryColor,
                size: 18.0.w,
              ),
            SizedBox(width: 8.0.w),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w600,
                color: isDisabled ? Colors.white : LanceColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
