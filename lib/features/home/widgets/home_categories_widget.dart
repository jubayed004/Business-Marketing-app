import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categoryItems = [
      {
        "icon": Icons.restaurant_menu_outlined,
        "label": AppStrings.restaurants.tr,
      },
      {
        "icon": Icons.shopping_basket_outlined,
        "label": AppStrings.grocery.tr,
      },
      {
        "icon": Icons.medication_outlined,
        "label": AppStrings.pharmacy.tr,
      },
      {
        "icon": Icons.storefront_outlined,
        "label": AppStrings.supermarket.tr,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.categories.tr,
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
        SizedBox(
          height: 96.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryItems.length,
            separatorBuilder: (context, index) => Gap(16.w),
            itemBuilder: (context, index) {
              final item = categoryItems[index];
              return Column(
                children: [
                  Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 8.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        item["icon"] as IconData,
                        color: AppColors.primaryColor,
                        size: 28.sp,
                      ),
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    item["label"] as String,
                    style: context.bodySmall.copyWith(
                      color: AppColors.darkTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
