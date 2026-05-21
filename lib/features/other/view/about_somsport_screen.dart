import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:som_spot/core/router/route_path.dart';
import 'package:som_spot/core/router/routes.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

class AboutSomSpotScreen extends StatelessWidget {
  const AboutSomSpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 64.w,
        title: Text(
          AppStrings.aboutSomSpot.tr,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppColors.darkTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  children: [
                    Gap(24.h),

                    // App Logo Section (Visual Masterpiece)
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor.withValues(alpha: 0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryColor.withValues(
                                    alpha: 0.25,
                                  ),
                                  blurRadius: 15.r,
                                  offset: Offset(0, 6.h),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Iconsax.radar,
                              color: Colors.white,
                              size: 40.sp,
                            ),
                          ),
                          Gap(14.h),
                          Text(
                            "SomSpot",
                            style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: AppColors.darkTextColor,
                              letterSpacing: 0.5.w,
                            ),
                          ),
                          Gap(4.h),
                          Text(
                            "Version 1.0.0",
                            style: context.bodySmall.copyWith(
                              color: AppColors.hintTextColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(32.h),

                    // Description Card
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.backgroundsLinesColor.withValues(
                            alpha: 0.8,
                          ),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.01),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Text(
                        "SomSpot is Somalia's leading local business discovery and promotional platform. We connect users with top-rated groceries, pharmacies, and restaurants around them. Enjoy exclusive discounts, claim deals directly in-app, and explore Mogadishu's finest spots with ease.",
                        textAlign: TextAlign.center,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.subtitleTextColor,
                          fontSize: 13.sp,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Gap(24.h),

                    // Navigation Links List Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.backgroundsLinesColor.withValues(
                            alpha: 0.8,
                          ),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.01),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildLinkTile(
                            context: context,
                            icon: Iconsax.shield_security,
                            title: AppStrings.privacyPolicy.tr,
                            onTap: () {
                              AppToast.info(
                                context: context,
                                message: AppStrings.navigatingToPrivacy.tr,
                              );
                              AppRouter.route.pushNamed(
                                RoutePath.privacyPolicyScreen,
                              );
                            },
                          ),
                          _buildDivider(),
                          _buildLinkTile(
                            context: context,
                            icon: Iconsax.document_text,
                            title: AppStrings.termsConditions.tr,
                            onTap: () {
                              AppToast.info(
                                context: context,
                                message: AppStrings.navigatingToTerms.tr,
                              );
                              AppRouter.route.pushNamed(
                                RoutePath.termsAndConditionsScreen,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer (Made with Love in Mogadishu)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Center(
                child: Text(
                  AppStrings.madeWithLove.tr,
                  style: context.bodyMedium.copyWith(
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: AppColors.primaryColor, size: 16.sp),
            ),
            Gap(12.w),
            Expanded(
              child: Text(
                title,
                style: context.bodyLarge.copyWith(
                  color: AppColors.darkTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Icon(
              Iconsax.arrow_right_3,
              color: AppColors.hintTextColor,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.backgroundsLinesColor.withValues(alpha: 0.5),
      height: 1.h,
      thickness: 1.h,
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
