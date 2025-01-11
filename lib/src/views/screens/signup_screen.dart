import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/signup_screen";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Signup"),
    );;
  }
}
