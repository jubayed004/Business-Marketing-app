import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:som_spot/share/widgets/network_image/custom_network_image.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

class HomeNearbyWidget extends StatelessWidget {
  const HomeNearbyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> nearbyItems = [
      {
        "image": "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=600&auto=format&fit=crop",
        "title": "Hilib Macaan Restaurant",
        "category": "Restaurant",
        "distance": "1.2 km",
        "isOpen": true,
        "rating": "4.8",
      },
      {
        "image": "https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=600&auto=format&fit=crop",
        "title": "Suuqa Bakaaraha Grocery",
        "category": "Grocery",
        "distance": "1.2 km",
        "isOpen": true,
        "rating": "4.8",
      },
      {
        "image": "https://images.unsplash.com/photo-1586015555751-63bb77f4322a?q=80&w=600&auto=format&fit=crop",
        "title": "Banadir Pharmacy",
        "category": "Pharmacy",
        "distance": "1.2 km",
        "isOpen": false,
        "rating": "4.8",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.nearbyYou.tr,
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.darkTextColor,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.seeAll.tr,
                style: context.bodyMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Gap(16.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: nearbyItems.length,
          separatorBuilder: (context, index) => Gap(16.h),
          itemBuilder: (context, index) {
            final item = nearbyItems[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Part
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.r),
                          ),
                          child: CustomNetworkImage(
                            imageUrl: item["image"] as String,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Star Rating Badge
                        Positioned(
                          top: 12.h,
                          right: 12.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.orangeSecondaryAccentColor,
                                  size: 14.sp,
                                ),
                                Gap(4.w),
                                Text(
                                  item["rating"] as String,
                                  style: context.bodySmall.copyWith(
                                    color: AppColors.darkTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Information Part
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"] as String,
                          style: context.titleLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkTextColor,
                          ),
                        ),
                        Gap(4.h),
                        Text(
                          item["category"] as String,
                          style: context.bodyMedium.copyWith(
                            color: AppColors.subtitleTextColor,
                          ),
                        ),
                        Gap(12.h),
                        Row(
                          children: [
                            // Distance
                            Icon(
                              Icons.location_on,
                              color: AppColors.primaryColor,
                              size: 16.sp,
                            ),
                            Gap(4.w),
                            Text(
                              item["distance"] as String,
                              style: context.bodySmall.copyWith(
                                color: AppColors.subtitleTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Gap(16.w),
                            // Open/Closed Status
                            Icon(
                              Icons.access_time_filled,
                              color: (item["isOpen"] as bool)
                                  ? AppColors.success
                                  : AppColors.error,
                              size: 16.sp,
                            ),
                            Gap(4.w),
                            Text(
                              (item["isOpen"] as bool)
                                  ? AppStrings.openNow.tr
                                  : AppStrings.closed.tr,
                              style: context.bodySmall.copyWith(
                                color: (item["isOpen"] as bool)
                                      ? AppColors.success
                                      : AppColors.error,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
