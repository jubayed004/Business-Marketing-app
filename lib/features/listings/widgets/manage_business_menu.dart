import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';

class ManageBusinessMenu extends StatelessWidget {
  const ManageBusinessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            context: context,
            title: AppStrings.editBusinessProfile.tr,
            icon: Icons.edit_outlined,
          ),
          _buildDivider(),
          _buildMenuItem(
            context: context,
            title: AppStrings.manageGallery.tr,
            icon: Iconsax.gallery,
          ),
          _buildDivider(),
          _buildMenuItem(
            context: context,
            title: AppStrings.operatingHours.tr,
            icon: Iconsax.clock,
          ),
          _buildDivider(),
          _buildMenuItem(
            context: context,
            title: AppStrings.updateLocation.tr,
            icon: Iconsax.location,
          ),
          _buildDivider(),
          _buildMenuItem(
            context: context,
            title: AppStrings.contactInformation.tr,
            icon: Iconsax.call,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.backgroundsLinesColor.withValues(alpha: 0.5),
      height: 1,
      thickness: 1,
      indent: 16.w,
      endIndent: 16.w,
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: isLast
          ? BorderRadius.vertical(bottom: Radius.circular(16.r))
          : BorderRadius.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.softSlateBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: AppColors.blueTextColor400, // Or slateIconColor
                size: 18.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkTextColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.hintTextColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
