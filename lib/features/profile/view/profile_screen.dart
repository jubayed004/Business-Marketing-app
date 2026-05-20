import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:som_spot/features/profile/controller/profile_controller.dart';
import 'package:som_spot/share/controller/language_controller.dart';
import 'package:som_spot/share/widgets/dialog/custom_dialog.dart';
import 'package:som_spot/share/widgets/network_image/custom_network_image.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';
import 'package:som_spot/core/router/routes.dart';
import 'package:som_spot/core/router/route_path.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileScreenController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blue Curved Header Wave Banner
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.r),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                16.w,
                MediaQuery.of(context).padding.top + 16.h,
                16.w,
                24.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.profile.tr,
                    style: context.titleLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  Gap(16.h),
                  // User details row
                  Obx(() {
                    return Row(
                      children: [
                        Container(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.w),
                          ),
                          child: ClipOval(
                            child: CustomNetworkImage(
                              imageUrl: controller.userAvatar.value,
                              boxShape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Gap(12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName.value,
                                style: context.titleMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Gap(2.h),
                              Text(
                                controller.userEmail.value,
                                style: context.bodyMedium.copyWith(
                                  color: Colors.white.withValues(alpha: 0.85),
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Edit Profile Icon Button
                        GestureDetector(
                          onTap: () => AppRouter.route.pushNamed(RoutePath.editProfileScreen),
                          child: Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.22),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Iconsax.edit_2,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  Gap(20.h),
                  // Statistics cards
                  Obx(() {
                    return Row(
                      children: [
                        _buildStatCard(AppStrings.saved.tr, controller.savedCount.value, context),
                        Gap(12.w),
                        _buildStatCard(AppStrings.claims.tr, controller.claimsCount.value, context),
                        Gap(12.w),
                        _buildStatCard(AppStrings.reviews.tr, controller.reviewsCount.value, context),
                      ],
                    );
                  }),
                ],
              ),
            ),

            // Scrollable Menu Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account section
                  _buildSectionHeader(AppStrings.account.tr),
                  Gap(8.h),
                  _buildMenuCard([
                    _buildMenuItem(
                      icon: Iconsax.user_edit,
                      title: AppStrings.editProfile.tr,
                      context: context,
                      onTap: () => AppRouter.route.pushNamed(RoutePath.editProfileScreen),
                    ),
                    _buildMenuItem(
                      icon: Iconsax.archive_1,
                      title: AppStrings.savedItems.tr,
                      context: context,
                      onTap: () {
                        AppToast.info(context: context, message: "You can view saved items from the Saved tab.");
                      },
                    ),
                    _buildMenuItem(
                      icon: Iconsax.ticket,
                      title: AppStrings.myClaims.tr,
                      context: context,
                      onTap: () => AppRouter.route.pushNamed(RoutePath.claimsScreen),
                    ),
                  ]),
                  Gap(20.h),

                  // Preferences section
                  _buildSectionHeader(AppStrings.preferences.tr),
                  Gap(8.h),
                  _buildMenuCard([
                    _buildMenuItem(
                      icon: Iconsax.global,
                      title: AppStrings.language.tr,
                      context: context,
                      onTap: () => _showLanguageDialog(context),
                    ),
                    _buildMenuItem(
                      icon: Iconsax.lock,
                      title: AppStrings.changePassword.tr,
                      context: context,
                      onTap: () {
                        AppToast.info(context: context, message: "Change password option coming soon.");
                      },
                    ),
                  ]),
                  Gap(20.h),

                  // Support section
                  _buildSectionHeader(AppStrings.support.tr),
                  Gap(8.h),
                  _buildMenuCard([
                    _buildMenuItem(
                      icon: Iconsax.message_question,
                      title: AppStrings.helpSupport.tr,
                      context: context,
                      onTap: () => AppRouter.route.pushNamed(RoutePath.helpAndSupportScreen),
                    ),
                    _buildMenuItem(
                      icon: Iconsax.info_circle,
                      title: AppStrings.aboutSomSpot.tr,
                      context: context,
                      onTap: () => AppRouter.route.pushNamed(RoutePath.aboutSomSpotScreen),
                    ),
                  ]),
                  Gap(24.h),

                  // Log Out Button
                  GestureDetector(
                    onTap: () => controller.logout(),
                    child: Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.02),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.logout,
                            color: AppColors.error,
                            size: 20.sp,
                          ),
                          Gap(8.w),
                          Text(
                            AppStrings.logOut.tr,
                            style: context.titleMedium.copyWith(
                              color: AppColors.error,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final langController = Get.find<LanguageController>();

    AppDialog.show(
      context: context,
      type: AppDialogType.custom,
      title: AppStrings.selectLanguage.tr,
      dismissible: true,
      content: Obx(() {
        return Column(
          children: List.generate(langController.languages.length, (index) {
            final lang = langController.languages[index];
            final isSelected = langController.selectedIndex.value == index;

            return GestureDetector(
              onTap: () {
                langController.selectLanguage(index);
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor.withValues(alpha: 0.08)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : AppColors.linesDarkColor,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 28.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundsLinesColor.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        lang.imageUrl,
                        style: TextStyle(fontSize: 22.sp),
                      ),
                    ),
                    Gap(14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.languageName,
                            style: context.titleSmall.copyWith(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.darkTextColor,
                            ),
                          ),
                          Gap(2.h),
                          Text(
                            lang.countryCode == 'SO'
                                ? 'Somali'
                                : lang.countryCode == 'SA'
                                    ? 'Arabic'
                                    : 'English',
                            style: context.bodySmall.copyWith(
                              color: AppColors.hintTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isSelected
                          ? Container(
                              key: const ValueKey('selected'),
                              width: 24.w,
                              height: 24.h,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 16.sp,
                              ),
                            )
                          : Container(
                              key: const ValueKey('unselected'),
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.linesDarkColor,
                                  width: 1.5.w,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildStatCard(String label, int value, BuildContext context) {
    return Expanded(
      child: Container(
        height: 68.h,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.toString(),
              style: context.titleLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            Gap(2.h),
            Text(
              label,
              style: context.bodyMedium.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.subtitleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 13.sp,
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Divider(
              color: AppColors.backgroundsLinesColor.withValues(alpha: 0.5),
              height: 1.h,
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            );
          }
          return items[index ~/ 2];
        }),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 16.sp,
            ),
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
}
