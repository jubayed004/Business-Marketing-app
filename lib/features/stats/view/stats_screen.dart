import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/features/stats/widgets/analytics_header.dart';
import 'package:som_spot/features/stats/widgets/analytics_overview_grid.dart';
import 'package:som_spot/features/stats/widgets/top_performing_offers_list.dart';
import 'package:som_spot/features/stats/widgets/top_deals_analytics_list.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: const AnalyticsHeader(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const AnalyticsOverviewGrid(),
                Gap(32.h),
                const TopPerformingOffersList(),
                Gap(32.h),
                const TopDealsAnalyticsList(),
                Gap(40.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
