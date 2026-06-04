import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/features/offers/widgets/offers_header.dart';
import 'package:som_spot/features/offers/widgets/offer_list_card.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBackgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const OffersHeader(),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  OfferListCard(
                    badgeText: '20%',
                    imagePath: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=600&auto=format&fit=crop',
                    restaurantName: 'Hilib Macaan Restaurant',
                    title: '20% Off Family Platter',
                    timeText: '${AppStrings.endsIn.tr} 2 days',
                    isEndingSoon: true,
                    actionText: '42 claims',
                    actionType: 0,
                  ),
                  OfferListCard(
                    badgeText: 'BOGO',
                    imagePath: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=600&auto=format&fit=crop',
                    restaurantName: 'Hayat Supermarket',
                    title: 'Buy 1 Get 1 Free - Fresh Juices',
                    timeText: '5 hours',
                    isEndingSoon: true,
                    actionText: AppStrings.claimed.tr,
                    actionType: 1,
                  ),
                  OfferListCard(
                    badgeText: '\$5 Deal',
                    imagePath: 'https://images.unsplash.com/photo-1511920170033-f8396924c348?q=80&w=600&auto=format&fit=crop',
                    restaurantName: 'Hilib Macaan Restaurant',
                    title: '20% Off Family Platter', // the design has this copy-pasted
                    timeText: '1 week',
                    isEndingSoon: false,
                    actionText: AppStrings.claim.tr,
                    actionType: 2,
                  ),
                  OfferListCard(
                    badgeText: 'BOGO',
                    imagePath: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=600&auto=format&fit=crop',
                    restaurantName: 'Hayat Supermarket',
                    title: 'Buy 1 Get 1 Free - Fresh Juices',
                    timeText: '5 hours',
                    isEndingSoon: true,
                    actionText: AppStrings.claimed.tr,
                    actionType: 1,
                  ),
                  Gap(40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
