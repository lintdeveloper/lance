import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard_screen";

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Dashboard"),
    );
  }
}
