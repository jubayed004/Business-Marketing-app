import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:som_spot/core/router/route_path.dart';

import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/features/nav/controller/navigation_controller.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final ValueNotifier<int> _selectedPlanIndex = ValueNotifier<int>(0);

  // ── Plan data (backend theke ashbe — ekhon static) ──
  final List<_PlanData> _plans = [
    _PlanData(
      name: 'Basic Business',
      monthlyPrice: 50,
      freeHotDeals: 0,
      extraPostPrice: 5,
      features: [
        'Business profile listing',
        'Basic analytics',
        'Email support',
      ],
      highlightFeature: 'No free hot deal posts',
    ),
    _PlanData(
      name: 'Growth',
      monthlyPrice: 75,
      freeHotDeals: 5,
      extraPostPrice: 5,
      features: [
        '5 free hot deal posts / month',
        'Advanced analytics',
        'Priority email support',
        'Custom branding',
      ],
      highlightFeature: '5 free hot deals included',
      isPopular: true,
    ),
    _PlanData(
      name: 'Premium',
      monthlyPrice: 150,
      freeHotDeals: 20,
      extraPostPrice: 3,
      features: [
        '20 free hot deal posts / month',
        'Full analytics dashboard',
        'Dedicated account manager',
        'API access & integrations',
        'Multi-location support',
      ],
      highlightFeature: '20 free hot deals included',
    ),
    _PlanData(
      name: 'Influencer Marketing',
      monthlyPrice: 300,
      freeHotDeals: -1, // unlimited
      extraPostPrice: 0,
      features: [
        'Unlimited hot deal posts',
        'Featured placement in app',
        'Social media promotion',
        'Influencer collaboration tools',
        'Dedicated success manager',
        'Priority phone & chat support',
      ],
      highlightFeature: 'Unlimited hot deals',
    ),
  ];

  @override
  void dispose() {
    _selectedPlanIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.softBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.goNamed(RoutePath.navigationPages);
            }
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: AppColors.darkTextColor,
          ),
        ),
        title: Text(
          AppStrings.subscriptionBilling.tr,
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.darkTextColor,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Current Plan Status Card ──
            _buildCurrentPlanCard(context),
            Gap(24.h),

            // ── Hot Deal Usage Card ──
            _buildUsageCard(context),
            Gap(28.h),

            // ── Choose Plan Header ──
            Text(
              AppStrings.upgrade.tr,
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.darkTextColor,
              ),
            ),
            Gap(4.h),
            Text(
              'Choose a plan that fits your business'.tr,
              style: context.bodyMedium.copyWith(
                color: AppColors.subtitleTextColor,
              ),
            ),
            Gap(20.h),

            // ── Plan Cards ──
            ValueListenableBuilder<int>(
              valueListenable: _selectedPlanIndex,
              builder: (context, selectedIndex, _) {
                return Column(
                  children: List.generate(_plans.length, (index) {
                    final plan = _plans[index];
                    final isSelected = selectedIndex == index;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: _buildPlanCard(
                        context: context,
                        plan: plan,
                        isSelected: isSelected,
                        onTap: () => _selectedPlanIndex.value = index,
                      ),
                    );
                  }),
                );
              },
            ),
            Gap(8.h),

            // ── How It Works Section ──
            _buildHowItWorksSection(context),
            Gap(24.h),
          ],
        ),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════
  // Current Plan Card (gradient hero)
  // ══════════════════════════════════════════════════════════
  Widget _buildCurrentPlanCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF6366F1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blueAccentColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  AppStrings.currentPlan.tr,
                  style: context.bodySmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Iconsax.crown1,
                color: AppColors.white.withValues(alpha: 0.8),
                size: 28.sp,
              ),
            ],
          ),
          Gap(16.h),
          Text(
            'Growth Plan', // backend theke ashbe
            style: context.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          Gap(4.h),
          Text(
            'Renews on Jul 5, 2026'.tr, // backend theke ashbe
            style: context.bodySmall.copyWith(
              color: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
          Gap(16.h),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$75',
                      style: context.headlineMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' /mo',
                      style: context.bodyMedium.copyWith(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.goNamed(RoutePath.navigationPages);
                  }
                  NavigationControllerMain.to.selectedNavIndex.value = 2;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    'Manage'.tr,
                    style: context.bodySmall.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════
  // Hot Deal Usage Card
  // ══════════════════════════════════════════════════════════
  Widget _buildUsageCard(BuildContext context) {
    // Ekhon static — backend theke ashbe
    const int used = 3;
    const int total = 5;
    const double progress = used / total;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.backgroundsLinesColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.amberYellowColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Iconsax.flash_1,
                  color: AppColors.amberYellowColor,
                  size: 20.sp,
                ),
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hot Deal Posts This Month'.tr,
                      style: context.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkTextColor,
                      ),
                    ),
                    Gap(2.h),
                    Text(
                      '$used of $total free posts used'.tr,
                      style: context.bodySmall.copyWith(
                        color: AppColors.subtitleTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(16.h),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8.h,
              backgroundColor: AppColors.softSlateBgColor,
              valueColor: AlwaysStoppedAnimation<Color>(
                progress >= 1.0 ? AppColors.error : AppColors.blueAccentColor,
              ),
            ),
          ),
          Gap(12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.blueAccentColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.info_circle,
                  size: 16.sp,
                  color: AppColors.blueAccentColor,
                ),
                Gap(8.w),
                Expanded(
                  child: Text(
                    'Extra posts after free limit: \$5 each'.tr,
                    style: context.bodySmall.copyWith(
                      color: AppColors.blueAccentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════
  // Plan Card
  // ══════════════════════════════════════════════════════════
  Widget _buildPlanCard({
    required BuildContext context,
    required _PlanData plan,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bool isDark = plan.isPopular && isSelected;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: isDark
              ? const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF6366F1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isDark ? null : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: isDark
              ? null
              : Border.all(
                  color: isSelected
                      ? AppColors.blueAccentColor
                      : AppColors.backgroundsLinesColor,
                  width: isSelected ? 2 : 1,
                ),
          boxShadow: isDark
              ? [
                  BoxShadow(
                    color: AppColors.blueAccentColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Expanded(
                    child: Text(
                      plan.name,
                      style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.white
                            : AppColors.darkTextColor,
                      ),
                    ),
                  ),
                  if (plan.isPopular)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.white.withValues(alpha: 0.2)
                            : AppColors.blueAccentColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.star1,
                            size: 12.sp,
                            color: isDark
                                ? AppColors.amberYellowColor
                                : AppColors.blueAccentColor,
                          ),
                          Gap(4.w),
                          Text(
                            'Popular',
                            style: context.bodySmall.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.white
                                  : AppColors.blueAccentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Gap(12.h),

              // Price
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${plan.monthlyPrice}',
                      style: context.headlineMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.white
                            : AppColors.darkTextColor,
                      ),
                    ),
                    TextSpan(
                      text: ' /mo',
                      style: context.bodyMedium.copyWith(
                        color: isDark
                            ? AppColors.white.withValues(alpha: 0.7)
                            : AppColors.subtitleTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(8.h),

              // Hot deal highlight
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.white.withValues(alpha: 0.12)
                      : AppColors.amberYellowColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Iconsax.flash_1,
                      size: 16.sp,
                      color: isDark
                          ? AppColors.amberYellowColor
                          : AppColors.amberYellowColor,
                    ),
                    Gap(8.w),
                    Text(
                      plan.highlightFeature,
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.white
                            : AppColors.darkTextColor,
                      ),
                    ),
                    if (plan.extraPostPrice > 0) ...[
                      Text(
                        '  •  \$${plan.extraPostPrice}/extra post',
                        style: context.bodySmall.copyWith(
                          color: isDark
                              ? AppColors.white.withValues(alpha: 0.7)
                              : AppColors.subtitleTextColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Gap(16.h),

              // Divider
              Container(
                height: 1,
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.15)
                    : AppColors.backgroundsLinesColor,
              ),
              Gap(16.h),

              // Features
              ...plan.features.map(
                (feature) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.white.withValues(alpha: 0.2)
                              : AppColors.emeraldGreenColor.withValues(
                                  alpha: 0.1,
                                ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 14.sp,
                          color: isDark
                              ? AppColors.white
                              : AppColors.emeraldGreenColor,
                        ),
                      ),
                      Gap(12.w),
                      Expanded(
                        child: Text(
                          feature,
                          style: context.bodyMedium.copyWith(
                            color: isDark
                                ? AppColors.white.withValues(alpha: 0.9)
                                : AppColors.darkTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(4.h),

              // Action Button
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: isDark
                    ? ElevatedButton(
                        onPressed: () {
                          // TODO: Payment integration (Stripe/Moyasar)
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.goNamed(RoutePath.navigationPages);
                          }
                          NavigationControllerMain.to.selectedNavIndex.value =
                              2;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.blueAccentColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        child: Text(
                          'Subscribe to ${plan.name}'.tr,
                          style: context.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueAccentColor,
                          ),
                        ),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          // TODO: Payment integration (Stripe/Moyasar)
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.goNamed(RoutePath.navigationPages);
                          }
                          NavigationControllerMain.to.selectedNavIndex.value =
                              2;
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.blueAccentColor
                                : AppColors.backgroundsLinesColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        child: Text(
                          isSelected
                              ? 'Subscribe to ${plan.name}'.tr
                              : 'Select Plan'.tr,
                          style: context.titleSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? AppColors.blueAccentColor
                                : AppColors.subtitleTextColor,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════
  // How It Works Section
  // ══════════════════════════════════════════════════════════
  Widget _buildHowItWorksSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.backgroundsLinesColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How Hot Deal Posting Works'.tr,
            style: context.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.darkTextColor,
            ),
          ),
          Gap(16.h),
          _buildStepItem(
            context,
            step: '1',
            title: 'Choose a plan'.tr,
            desc: 'Select a subscription that fits your needs'.tr,
          ),
          _buildStepItem(
            context,
            step: '2',
            title: 'Post hot deals'.tr,
            desc: 'Use your free posts each month'.tr,
          ),
          _buildStepItem(
            context,
            step: '3',
            title: 'Need more?'.tr,
            desc: 'Pay per extra post after your free limit'.tr,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(
    BuildContext context, {
    required String step,
    required String title,
    required String desc,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: AppColors.blueAccentColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  step,
                  style: context.bodySmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 30.h,
                color: AppColors.blueAccentColor.withValues(alpha: 0.2),
              ),
          ],
        ),
        Gap(14.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkTextColor,
                  ),
                ),
                Gap(2.h),
                Text(
                  desc,
                  style: context.bodySmall.copyWith(
                    color: AppColors.subtitleTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Plan Data Model (ekhon local — pore backend model hobe) ──
class _PlanData {
  final String name;
  final int monthlyPrice;
  final int freeHotDeals; // -1 = unlimited
  final int extraPostPrice;
  final List<String> features;
  final String highlightFeature;
  final bool isPopular;

  const _PlanData({
    required this.name,
    required this.monthlyPrice,
    required this.freeHotDeals,
    required this.extraPostPrice,
    required this.features,
    required this.highlightFeature,
    this.isPopular = false,
  });
}
