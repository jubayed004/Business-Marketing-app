import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:som_spot/core/router/route_path.dart';
import 'package:som_spot/core/router/routes.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';

class OffersHeader extends StatefulWidget {
  const OffersHeader({super.key});

  @override
  State<OffersHeader> createState() => _OffersHeaderState();
}

class _OffersHeaderState extends State<OffersHeader> {
  final ValueNotifier<int> _selectedTabIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedTabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 16.h,
        left: 20.w,
        right: 20.w,
        bottom: 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.offers.tr,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTextColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blueAccentColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: IconButton(
                  onPressed: () {
                    AppRouter.route.pushNamed(RoutePath.createOfferScreen);
                  },
                  icon: const Icon(Icons.add, color: AppColors.white),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
                ),
              ),
            ],
          ),
          Gap(20.h),
          ValueListenableBuilder<int>(
            valueListenable: _selectedTabIndex,
            builder: (context, selectedIndex, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildTabPill(
                      context: context,
                      title: AppStrings.active.tr,
                      count: '3',
                      isActive: selectedIndex == 0,
                      onTap: () => _selectedTabIndex.value = 0,
                    ),
                    Gap(12.w),
                    _buildTabPill(
                      context: context,
                      title: AppStrings.scheduled.tr,
                      count: '2',
                      isActive: selectedIndex == 1,
                      onTap: () => _selectedTabIndex.value = 1,
                    ),
                    Gap(12.w),
                    _buildTabPill(
                      context: context,
                      title: AppStrings.paused.tr,
                      count: '1',
                      isActive: selectedIndex == 2,
                      onTap: () => _selectedTabIndex.value = 2,
                    ),
                    Gap(12.w),
                    _buildTabPill(
                      context: context,
                      title: AppStrings.expired.tr,
                      count: '2',
                      isActive: selectedIndex == 3,
                      onTap: () => _selectedTabIndex.value = 3,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabPill({
    required BuildContext context,
    required String title,
    required String count,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.blueAccentColor
              : AppColors.softBackgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.bodyMedium.copyWith(
                color: isActive ? AppColors.white : AppColors.darkTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.white.withValues(alpha: 0.2)
                    : AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                count,
                style: context.bodySmall.copyWith(
                  color: isActive ? AppColors.white : AppColors.subtitleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
