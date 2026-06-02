import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:som_spot/features/auth/completed_profile/controller/completed_profile_controller.dart';
import 'package:som_spot/share/widgets/text_field/custom_text_field.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

class BusinessCategory {
  final String labelKey;
  final IconData icon;

  const BusinessCategory({
    required this.labelKey,
    required this.icon,
  });
}

class BusinessInfoStep extends StatelessWidget {
  const BusinessInfoStep({super.key});

  static final List<BusinessCategory> categories = [
    const BusinessCategory(
      labelKey: AppStrings.categoryRestaurant,
      icon: Icons.restaurant_outlined,
    ),
    const BusinessCategory(
      labelKey: AppStrings.categoryGrocery,
      icon: Icons.shopping_basket_outlined,
    ),
    const BusinessCategory(
      labelKey: AppStrings.categoryPharmacy,
      icon: Icons.local_pharmacy_outlined,
    ),
    const BusinessCategory(
      labelKey: AppStrings.categorySupermarket,
      icon: Icons.shopping_cart_outlined,
    ),
    const BusinessCategory(
      labelKey: AppStrings.categoryCafes,
      icon: Icons.local_cafe_outlined,
    ),
    const BusinessCategory(
      labelKey: AppStrings.categoryElectronics,
      icon: Icons.phone_android_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CompletedProfileController>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(8.h),

          // ── Title ──
          Text(
            AppStrings.tellUsAboutBusiness.tr,
            style: context.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.darkTextColor,
            ),
          ),
          Gap(8.h),

          // ── Subtitle ──
          Text(
            AppStrings.businessDiscoverSubtitle.tr,
            style: context.bodyLarge.copyWith(
              color: AppColors.subtitleTextColor,
              height: 1.5,
            ),
          ),
          Gap(24.h),

          // ── Business Name ──
          CustomTextField(
            controller: controller.businessNameController,
            title: AppStrings.businessName.tr,
            hintText: AppStrings.enterBusinessName.tr,
            textInputAction: TextInputAction.next,
          ),
          Gap(24.h),

          // ── Category ──
          Text(
            AppStrings.category.tr,
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkTextColor,
            ),
          ),
          Gap(12.h),

          // ── Category Selector Grid ──
          Obx(() {
            final selected = controller.selectedCategory.value;
            return Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: categories.map((cat) {
                final isSelected = selected == cat.labelKey;
                return GestureDetector(
                  onTap: () {
                    controller.selectedCategory.value = cat.labelKey;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 74.w,
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor.withValues(alpha: 0.05)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.backgroundsLinesColor,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          cat.icon,
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.subtitleTextColor,
                          size: 24.sp,
                        ),
                        Gap(8.h),
                        Text(
                          cat.labelKey.tr,
                          textAlign: TextAlign.center,
                          style: context.labelSmall.copyWith(
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.darkTextColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }),
          Gap(24.h),

          // ── Short Description ──
          CustomTextField(
            controller: controller.shortDescriptionController,
            title: AppStrings.shortDescription.tr,
            hintText: AppStrings.businessDescriptionHint.tr,
            maxLines: 4,
            minLines: 3,
            textInputAction: TextInputAction.done,
          ),
          Gap(32.h),
        ],
      ),
    );
  }
}
