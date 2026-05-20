import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:som_spot/features/home/widgets/home_header_widget.dart';
import 'package:som_spot/features/home/widgets/home_categories_widget.dart';
import 'package:som_spot/features/home/widgets/home_deals_widget.dart';
import 'package:som_spot/features/home/widgets/home_top_deals_widget.dart';
import 'package:som_spot/features/home/widgets/home_nearby_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeaderWidget(),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeCategoriesWidget(),
                  Gap(24.h),
                  const HomeDealsWidget(),
                  Gap(24.h),
                  const HomeTopDealsWidget(),
                  Gap(24.h),
                  const HomeNearbyWidget(),
                  Gap(24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
