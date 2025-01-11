import 'package:flutter/material.dart';

class CustomFoundation extends StatelessWidget {
  const CustomFoundation({Key? key, this.backgroundColor, required this.child ,this.resizeToAvoidBottomInset})
      : super(key: key);
  final Color? backgroundColor;
  final Widget child;
  final bool? resizeToAvoidBottomInset;
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              // backgroundColor: VircapColors.primaryColor,
            )
        ),
        body: SafeArea(child: child));
  }
}
