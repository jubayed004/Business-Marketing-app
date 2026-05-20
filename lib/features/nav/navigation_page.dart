import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:som_spot/features/nav/controller/navigation_controller.dart';
import 'package:som_spot/utils/color/app_colors.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key, this.index = 0});

  final int index;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _controller = Get.put(NavigationControllerMain());

  @override
  void initState() {
    super.initState();
    _controller.selectedNavIndex.value = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _controller.getPages()[_controller.selectedNavIndex.value];
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10.r,
              offset: Offset(0, -2.h),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                _controller.icons.length,
                (index) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _controller.selectedNavIndex.value = index;
                    },
                    child: Obx(() {
                      bool isSelected =
                          _controller.selectedNavIndex.value == index;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _controller.icons[index],
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.grayTextSecondaryColor,
                            size: 24.sp,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            _controller.labels[index].tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.grayTextSecondaryColor,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
