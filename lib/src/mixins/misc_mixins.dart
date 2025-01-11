import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lance/utils/utils.dart';

mixin MiscMixin<T extends StatefulWidget> on State<T> {



  void errorCallback(String msg) {
    Navigator.pop(context);
    Flushbar(
      backgroundColor: const Color.fromRGBO(255, 69, 65, 1),
      flushbarPosition: FlushbarPosition.TOP,
      title: "Error",
      message: msg,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  void warningCallback(String msg) {
    Flushbar(
      backgroundColor: Colors.black,
      flushbarPosition: FlushbarPosition.TOP,
      title: "Warning",
      message: msg,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  Future<bool> onBackPressed() async {
    final response = await showModalBottomSheet(isScrollControlled: true,
      context: context, enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Container() // LogoutBottomSheet() should allow users to option to logout
        );
      },
    );
    if (!response) return response;
    ShowDialog(context: context);
    Future.delayed(const Duration(seconds: 10));
    return true;
  }

}