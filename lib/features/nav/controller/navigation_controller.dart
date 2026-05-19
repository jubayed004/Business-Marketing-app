import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationControllerMain extends GetxController {
  RxInt selectedNavIndex = 0.obs;

  List<Widget> getPages() {
    return [
      Text("data"),
      Text("data"),
      Text("data"),

    ];
    // return [HomeScreen(), ScanScreen(), ProfileScreen()];
  }

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.qr_code_scanner_outlined,
    Icons.person_outline,
  ];

  final List<String> labels = ["Home", "Scan", "Profile"];
}
