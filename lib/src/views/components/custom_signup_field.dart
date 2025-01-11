import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lance/shared/widgets/custom_text_field.dart';
import 'package:lance/src/views/widgets/custom__material_button.dart';
import 'package:lance/src/views/widgets/custom_email_field.dart';
import 'package:lance/src/views/widgets/custom_password_field.dart';

class CustomSignupField extends StatefulWidget {
  const CustomSignupField({super.key, required this.emailController,
    required this.passwordController, required this.confirmPasswordController});


  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<CustomSignupField> createState() => _CustomSignupFieldState();
}

class _CustomSignupFieldState extends State<CustomSignupField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomEmailTextField(
          emailController: widget.emailController,
          hint: "Enter your email address",
          label: "Email Address",
          validator: _validateEmail,
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.0.h),
        CustomPasswordField(passwordController: widget.passwordController,
            hint: "Enter your password",
            label: "Password"),
        SizedBox(height: 16.0.h),
        // CustomPasswordField(
        //   controller: _confirmPasswordController,
        //   hint: "Enter your password",
        //   label: "Password",
        //   validator: (String? value) {
        //     if (value != _passwordController.text) {
        //       return "Passwords do not match";
        //     }
        //     return null;
        //   },
        // ),
        SizedBox(height: 32.0.h),
        CustomMaterialButton(
          buttonText: "Sign Up",
          onPressed: () {
            // Navigator.of(context).pushNamed(AppRoutes.loadingScreen);
          },
        ),
      ],
    );;
  }

  static String? _validateEmail(String? value) {
    RegExp emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (emailRegex.hasMatch(value ?? "")) return null;

    return "Please enter a valid email address.";
  }
}
