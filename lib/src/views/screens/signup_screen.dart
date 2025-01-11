import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lance/shared/shared.dart';
import 'package:lance/src/views/components/custom_signup_field.dart';
import 'package:lance/src/views/widgets/spacer.dart';
import 'package:lance/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/signup_screen";

  const SignupScreen({super.key});


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  final _formKey = GlobalKey<FormState>();


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return CustomFoundation(
        backgroundColor: LanceColors.primaryColor,
        child: Scaffold(
          body: ResponsiveSafeArea(builder: (content, size) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.width * 0.12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(LanceVectors.lanceIcon,
                              height: 40.0.w,
                              width: 40.0.w,
                            ),
                          ),
                          SizedBox(height: 24.0.h),
                          Text(looksYoureNewText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.w600,
                              color: LanceColors.textColor,
                            ),
                          ),
                          SizedBox(height: 4.0.h),
                          Text(
                            "Let's create your account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                              color: LanceColors.textColor,
                            ),
                          ),
                          SizedBox(height: 36.0.h),
                          CustomSignupField(
                            emailController: _emailController,
                            passwordController: _passwordController,
                            confirmPasswordController: _confirmPasswordController,
                          ),
                          SizedBox(height: 10.0.h),
                          Text(orText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w600,
                              color: LanceColors.textColor,
                            ),
                          ),
                          SizedBox(height: 10.0.h),
                          _buildSocialIcons(),
                          SizedBox(height: 80.0.h),
                          const Height(height: 0.04),
                          _buildFooter(),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color:  _fNameBorderColor),
                          //     borderRadius: BorderRadius.circular(16),
                          //   ),
                          //   child: TextFormField(focusNode: _fNameFocusNode,
                          //     controller: _firstNameController,
                          //     keyboardType: TextInputType.text,
                          //     textInputAction: TextInputAction.next,
                          //     cursorColor: VircapColors.primaryColor,
                          //     onChanged: (value) => _onChangeInputFields(),
                          //     validator: RequiredValidator(errorText: 'Enter a valid name'),
                          //     decoration: VircapDecorations.formStyle.copyWith(
                          //       labelText: firstNameText,
                          //       errorBorder: VircapThemes.errorBorder,
                          //       contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          //       border: InputBorder.none,
                          //       labelStyle: VircapTextStyle.textSize14.copyWith(
                          //           color: VircapColors.gray3Color, fontWeight: FontWeight.w500),
                          //     ),
                          //   ),
                          // ),
                          // _fNameFocusNode.hasFocus ? Container(
                          //     margin: EdgeInsets.only(top: size.height * 0.01,
                          //         bottom: size.height * 0.027),
                          //     child: Text(makeSureLegalNameText, style: VircapTextStyle.textSize12.copyWith(
                          //         color: VircapColors.textColor2
                          //     ))): const Height(height: 0.027),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Container(
                          //       width: size.width * 0.44,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(color:  _lNameBorderColor),
                          //         borderRadius: BorderRadius.circular(16),
                          //       ),
                          //       child: TextFormField(focusNode: _mNameFocusNode,
                          //         controller: _mNameController,
                          //         keyboardType: TextInputType.text,
                          //         textInputAction: TextInputAction.next,
                          //         cursorColor: VircapColors.primaryColor,
                          //         onChanged: (value) => _onChangeInputFields(),
                          //         decoration: VircapDecorations.formStyle.copyWith(
                          //           labelText: middleNameText,
                          //           contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          //           border: InputBorder.none,
                          //           errorBorder: VircapThemes.errorBorder,
                          //           labelStyle: VircapTextStyle.textSize14.copyWith(
                          //               color: VircapColors.gray3Color, fontWeight: FontWeight.w500),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: size.width * 0.44,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(color:  _lNameBorderColor),
                          //         borderRadius: BorderRadius.circular(16),
                          //       ),
                          //       child: TextFormField(focusNode: _lNameFocusNode,
                          //         controller: _lastNameController,
                          //         keyboardType: TextInputType.text,
                          //         textInputAction: TextInputAction.next,
                          //         cursorColor: VircapColors.primaryColor,
                          //         onChanged: (value) => _onChangeInputFields(),
                          //         validator: RequiredValidator(errorText: 'Enter a valid name'),
                          //         decoration: VircapDecorations.formStyle.copyWith(
                          //           labelText: lastNameText,
                          //           contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          //           border: InputBorder.none,
                          //           errorBorder: VircapThemes.errorBorder,
                          //           labelStyle: VircapTextStyle.textSize14.copyWith(
                          //               color: VircapColors.gray3Color, fontWeight: FontWeight.w500),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const Height(height: 0.027),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color:  _emailBorderColor),
                          //     borderRadius: BorderRadius.circular(16),
                          //   ),
                          //   child: TextFormField(focusNode: _emailFocusNode,
                          //     controller: _emailController,
                          //     keyboardType: TextInputType.emailAddress,
                          //     textInputAction: TextInputAction.next,
                          //     cursorColor: VircapColors.primaryColor,
                          //     onChanged: (value) => _onChangeInputFields(),
                          //     validator: (value) => isEmailValid(value!) ? null: 'Enter a valid email',
                          //     decoration: VircapDecorations.formStyle.copyWith(
                          //       labelText: emailAddressText,
                          //       contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          //       border: InputBorder.none,
                          //       errorBorder: VircapThemes.errorBorder,
                          //       labelStyle: VircapTextStyle.textSize14.copyWith(
                          //           color: VircapColors.gray3Color, fontWeight: FontWeight.w500),
                          //     ),
                          //   ),
                          // ),
                          // const Height(height: 0.027),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color:  _referralBorderColor),
                          //     borderRadius: BorderRadius.circular(16),
                          //   ),
                          //   child: TextFormField(focusNode: _referralFocusNode,
                          //     controller: _referralController,
                          //     keyboardType: TextInputType.emailAddress,
                          //     textInputAction: TextInputAction.next,
                          //     cursorColor: VircapColors.primaryColor,
                          //     onChanged: (value) => _onChangeInputFields(),
                          //     decoration: VircapDecorations.formStyle.copyWith(
                          //       labelText: referralCodeOptionalText,
                          //       contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          //       border: InputBorder.none,
                          //       errorBorder: VircapThemes.errorBorder,
                          //       labelStyle: VircapTextStyle.textSize14.copyWith(
                          //           color: VircapColors.gray3Color, fontWeight: FontWeight.w500),
                          //     ),
                          //   ),
                          // ),
                          // const Height(height: 0.027),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color:  _passBorderColor),
                          //     borderRadius: BorderRadius.circular(16),
                          //   ),
                          //   child: TextFormField(
                          //     controller: _passwordController,
                          //     onTap: () {
                          //       setState(() {
                          //         passwordStrength = !passwordStrength;
                          //       });
                          //     },
                          //     focusNode: _passwordFocusNode,
                          //     cursorColor: VircapColors.primaryColor,
                          //     obscureText: showPassword,
                          //     onChanged: (value) {
                          //       _onChangePasswordStrengthValidator(value);
                          //       _onChangeInputFields();
                          //     },
                          //     keyboardType: TextInputType.text,
                          //     textInputAction: TextInputAction.done,
                          //     decoration: VircapDecorations.formStyle.copyWith(
                          //       hintText: passwordText,
                          //       hintStyle: VircapTextStyle.textSize12,
                          //       contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          //       border: InputBorder.none,
                          //       errorBorder: VircapThemes.errorBorder,
                          //       labelText: passwordText,
                          //       suffixIcon: InkWell(
                          //         onTap: () {
                          //           setState(() {
                          //             showPassword = !showPassword;
                          //           });
                          //         },
                          //         child: Icon(
                          //           Icons.remove_red_eye,
                          //           color: showPassword
                          //               ? VircapColors.iconColor
                          //               : VircapColors.primaryColor,
                          //         ),
                          //       ),
                          //       labelStyle: VircapTextStyle.textSize14.copyWith(
                          //           color: VircapColors.gray3Color, fontWeight: FontWeight.w500),
                          //     ),
                          //   ),
                          // ),
                          // const Height(height: 0.01),
                          // Visibility(
                          //   visible: _isVisible,
                          //   maintainAnimation: true,
                          //   maintainState: true,
                          //   maintainSize: true,
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         children: [
                          //           // A Number
                          //           hasPasswordOneNumber
                          //               ? Row(
                          //             children: [
                          //               const Icon(Icons.check,
                          //                 size: 10,
                          //                 color: VircapColors.greenColor,
                          //               ),
                          //               const Width3(),
                          //               Text('A Number',
                          //                 style: VircapTextStyle.textSize10
                          //                     .copyWith(
                          //                     color: VircapColors
                          //                         .greenColor),
                          //               )
                          //             ],
                          //           ) : Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: const Duration(
                          //                     milliseconds: 500),
                          //                 width: 6,
                          //                 height: 6,
                          //                 color: VircapColors.borderColor,
                          //               ),
                          //               const Width5(),
                          //               Text('A Number',
                          //                 style: VircapTextStyle.textSize10
                          //                     .copyWith(
                          //                     color: VircapColors
                          //                         .blackColor),
                          //               )
                          //             ],
                          //           ),
                          //           const Width20(),
                          //           //An Uppercase Letter
                          //           hasUppercaseLetter ? Row(
                          //             children: [
                          //               const Icon(Icons.check, size: 10,
                          //                 color: VircapColors.greenColor,
                          //               ),
                          //               const Width3(),
                          //               Text('An Uppercase Letter',
                          //                 style: VircapTextStyle.textSize10
                          //                     .copyWith(color: VircapColors
                          //                     .greenColor),
                          //               )
                          //             ],
                          //           ) : Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: const Duration(
                          //                     milliseconds: 500),
                          //                 width: 6,
                          //                 height: 6,
                          //                 color: VircapColors.borderColor,
                          //               ),
                          //               const Width5(),
                          //               Text('An Uppercase Letter',
                          //                 style: VircapTextStyle.textSize10
                          //                     .copyWith(
                          //                     color: VircapColors
                          //                         .blackColor),
                          //               )
                          //             ],
                          //           ),
                          //           const Width20(),
                          //           // A Lowercase Letter
                          //           hasLowercaseLetter
                          //               ? Row(
                          //             children: [
                          //               const Icon(
                          //                 Icons.check,
                          //                 size: 10,
                          //                 color: VircapColors.greenColor,
                          //               ),
                          //               const Width3(),
                          //               Text(
                          //                 'A Lowercase Letter',
                          //                 style: VircapTextStyle.textSize10
                          //                     .copyWith(
                          //                     color: VircapColors
                          //                         .greenColor),
                          //               )
                          //             ],
                          //           ) : Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: const Duration(
                          //                     milliseconds: 500),
                          //                 width: 6,
                          //                 height: 6,
                          //                 color: VircapColors.borderColor,
                          //               ),
                          //               const Width5(),
                          //               Text(
                          //                 'A Lowercase Letter',
                          //                 style: VircapTextStyle.textSize10
                          //                     .copyWith(
                          //                     color: VircapColors
                          //                         .blackColor),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       const Height10(),
                          //       Row(children: [
                          //         (hasCharacter)
                          //             ? Row(
                          //           children: [
                          //             const Icon(
                          //               Icons.check,
                          //               size: 10,
                          //               color: VircapColors.greenColor,
                          //             ),
                          //             const Width3(),
                          //             Text('A Special Character',
                          //               style: VircapTextStyle.textSize10
                          //                   .copyWith(
                          //                   color: VircapColors
                          //                       .greenColor),
                          //             )
                          //           ],
                          //         )
                          //             : Row(
                          //           children: [
                          //             AnimatedContainer(
                          //               duration: const Duration(
                          //                   milliseconds: 500),
                          //               width: 6,
                          //               height: 6,
                          //               color: VircapColors.borderColor,
                          //             ),
                          //             const Width5(),
                          //             Text('A Special Character',
                          //               style: VircapTextStyle.textSize10
                          //                   .copyWith(
                          //                   color: VircapColors
                          //                       .blackColor),
                          //             )
                          //           ],
                          //         ),
                          //         const Width30(),
                          //         Row(
                          //           children: [
                          //             _isPasswordEightChars
                          //                 ? Row(
                          //               children: [
                          //                 const Icon(
                          //                   Icons.check,
                          //                   size: 10,
                          //                   color: VircapColors.greenColor,
                          //                 ),
                          //                 const Width3(),
                          //                 Text('Minimum of 8 Characters',
                          //                   style: VircapTextStyle
                          //                       .textSize10
                          //                       .copyWith(
                          //                       color: VircapColors
                          //                           .greenColor),
                          //                 )
                          //               ],
                          //             ) : Row(
                          //               children: [
                          //                 AnimatedContainer(duration: const Duration(
                          //                     milliseconds: 500),
                          //                   width: 6, height: 6,
                          //                   color: VircapColors.borderColor,
                          //                 ),
                          //                 const Width5(),
                          //                 Text('Minimum of 8 Characters',
                          //                   style: VircapTextStyle.textSize10.copyWith(
                          //                       color: VircapColors.blackColor),
                          //                 )
                          //               ],
                          //             )
                          //           ],
                          //         )
                          //       ],
                          //       ),
                          //       SizedBox(height: size.height * 0.005),
                          //
                          //     ],
                          //   ),
                          // ),
                          // Theme(
                          //   data: ThemeData(
                          //     checkboxTheme:  checkboxTheme.copyWith(
                          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
                          //           side: const BorderSide(color: VircapColors.strokeColor)
                          //       ),
                          //
                          //       fillColor:MaterialStateProperty.resolveWith<Color>(
                          //               (Set<MaterialState> states) {
                          //             if (states.contains(MaterialState.selected)) {
                          //               return VircapColors.primaryColor;
                          //             }
                          //             return VircapColors.whiteColor; // Use the default value.
                          //           }
                          //       ),
                          //     ),
                          //     unselectedWidgetColor: VircapColors.strokeColor,
                          //
                          //   ),
                          //   child: ListTileTheme(
                          //     contentPadding: const EdgeInsets.only(right: 0.0),
                          //     child: CheckboxListTile(
                          //       title:  Transform.translate(
                          //         offset: const Offset(-15, 0),
                          //         child: Container(
                          //           margin: const EdgeInsets.only(top: 12),
                          //           child: RichText(
                          //             text: TextSpan(
                          //               text: 'I have read, understood and agreed to',
                          //               style: VircapTextStyle.textSize12.copyWith(
                          //                   color: VircapColors.blackColor),
                          //               children: <TextSpan>[
                          //                 TextSpan(text: ' Vircap\'s', style: VircapTextStyle.textSize12.copyWith(
                          //                 )),
                          //                 TextSpan(text: ' Privacy', style: VircapTextStyle.textSize12.copyWith(
                          //                     decoration: TextDecoration.underline)),
                          //                 const TextSpan(text: ' and '),
                          //                 TextSpan(text: ' Terms and condition', style: VircapTextStyle.textSize12.copyWith(
                          //                     decoration: TextDecoration.underline
                          //                 )),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       value: _isTermsPrivacy,
                          //       onChanged: (bool? newValue) {
                          //         setState(() {
                          //           _isTermsPrivacy = newValue!;
                          //         });
                          //       },
                          //       dense: false,
                          //       controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                          //     ),
                          //   ),
                          // ),
                          // const Height(height: 0.015),
                          // CustomButton(
                          //   text: Text(createAccountText,
                          //     style: VircapTextStyle.textSize14
                          //         .copyWith(fontWeight: FontWeight.w700),
                          //   ),
                          //   onPressed: _checkButton()
                          //       ? null
                          //       : () {
                          //     final amplitudeVm = context
                          //         .read<AmplitudeAnalyticsViewModel>();
                          //     amplitudeVm.logCreateAccount();
                          //     _signupAction(context);
                          //   },
                          //   height: null, width: null,)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * .06),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(alreadyHaveAnAccountText,
                              style: LanceTextStyle.textSize12,
                            ),

                            InkWell(
                              onTap: () {

                                // => Navigator.pushNamed(context, LoginScreen.routeName)
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(signInText, style: LanceTextStyle.textSize16.copyWith(
                                    color: LanceColors.primaryColor,
                                    fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        )
    );
  }


  Widget _buildFooter() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By signing up you agree to our ",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.0.sp,
          color: LanceColors.textColor,
        ),
        children: [
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: LanceColors.primaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 14.0.sp,
            ),
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(
              color: LanceColors.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.0.sp,
            ),
          ),
          TextSpan(
            text: 'Policy',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: LanceColors.primaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 14.0.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/google.svg'),
        SizedBox(width: 24.0.w),
        SvgPicture.asset('assets/icons/facebook.svg'),
      ],
    );
  }

  // Widget _buildForm() {
  //   return Column(
  //     children: [
  //       InputField(
  //         controller: _emailController,
  //         hint: "Enter your email address",
  //         label: "Email Address",
  //         validator: AppMethods.emailValidator,
  //         textInputType: TextInputType.emailAddress,
  //       ),
  //       SizedBox(height: 16.0.h),
  //       PasswordInputField(
  //         controller: _passwordController,
  //         hint: "Enter your password",
  //         label: "Password",
  //       ),
  //       SizedBox(height: 16.0.h),
  //       PasswordInputField(
  //         controller: _confirmPasswordController,
  //         hint: "Enter your password",
  //         label: "Password",
  //         validator: (String? value) {
  //           if (value != _passwordController.text) {
  //             return "Passwords do not match";
  //           }
  //           return null;
  //         },
  //       ),
  //       SizedBox(height: 32.0.h),
  //       PrimaryButton(
  //         buttonText: "Sign Up",
  //         onPressed: () {
  //           Navigator.of(context).pushNamed(AppRoutes.loadingScreen);
  //         },
  //       ),
  //     ],
  //   );
  // }
}
