import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:som_spot/features/home/view/home_screen.dart';
import 'package:som_spot/features/search/view/search_screen.dart';
import 'package:som_spot/features/saved/view/saved_screen.dart';
import 'package:som_spot/features/alerts/view/alerts_screen.dart';
import 'package:som_spot/features/profile/main_profile/view/profile_screen.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/common_controller/common_controller.dart';
import 'package:som_spot/features/dashboard/view/dashboard_screen.dart';

class NavigationControllerMain extends GetxController {
  static NavigationControllerMain get to => Get.find();
  RxInt selectedNavIndex = 0.obs;

  List<Widget> getPages() {
    return [
      CommonController.to.isSeller.value ? DashboardScreen() : HomeScreen(),
      const SearchScreen(),
      const SavedScreen(),
      const AlertsScreen(),
      const ProfileScreen(),
    ];
  }

  final List<IconData> icons = [
    Iconsax.home,
    Iconsax.search_normal,
    Iconsax.bookmark,
    Iconsax.notification,
    Iconsax.user,
  ];

  final List<String> labels = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.saved,
    AppStrings.alerts,
    AppStrings.profile,
  ];
}
