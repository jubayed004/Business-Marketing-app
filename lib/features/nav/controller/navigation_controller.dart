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
import 'package:som_spot/features/listings/view/listing_screen.dart';
import 'package:som_spot/features/offers/view/offers_screen.dart';
import 'package:som_spot/features/stats/view/stats_screen.dart';

class NavigationControllerMain extends GetxController {
  static NavigationControllerMain get to => Get.find();
  RxInt selectedNavIndex = 0.obs;

  List<Widget> getPages() {
    return CommonController.to.isSeller.value
        ? [
            const DashboardScreen(),
            const ListingScreen(), // Listings
            const OffersScreen(), // Offers
            const StatsScreen(), // Stats
            const ProfileScreen(),
          ]
        : const [
            HomeScreen(),
            SearchScreen(),
            SavedScreen(),
            AlertsScreen(),
            ProfileScreen(),
          ];
  }

  List<IconData> get icons => CommonController.to.isSeller.value
      ? [
          Iconsax.element_3,
          Iconsax.shop,
          Iconsax.tag,
          Iconsax.chart,
          Iconsax.user,
        ]
      : [
          Iconsax.home,
          Iconsax.search_normal,
          Iconsax.bookmark,
          Iconsax.notification,
          Iconsax.user,
        ];

  List<String> get labels => CommonController.to.isSeller.value
      ? [
          AppStrings.dashboard,
          AppStrings.listings,
          AppStrings.offers,
          AppStrings.stats,
          AppStrings.profile,
        ]
      : [
          AppStrings.home,
          AppStrings.search,
          AppStrings.saved,
          AppStrings.alerts,
          AppStrings.profile,
        ];
}
