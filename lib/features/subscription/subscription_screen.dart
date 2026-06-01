// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:health_tracker_app/core/custom_assets/assets.gen.dart';
// import 'package:health_tracker_app/core/router/route_path.dart';
// import 'package:health_tracker_app/core/router/routes.dart';
// import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
// import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
// import 'package:health_tracker_app/utils/color/app_colors.dart';
// import 'package:health_tracker_app/utils/extension/base_extension.dart';
//
// class SubscriptionScreen extends StatefulWidget {
//   const SubscriptionScreen({super.key});
//
//   @override
//   State<SubscriptionScreen> createState() => _SubscriptionScreenState();
// }
//
// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//   final ValueNotifier<int> _selectedPlanIndex = ValueNotifier<int>(
//     1,
//   ); // 0: Monthly, 1: Yearly (Default)
//
//   @override
//   void dispose() {
//     _selectedPlanIndex.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 24.0,
//                 vertical: 10,
//               ),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: CircularArrowButton(onTap: () => AppRouter.route.pop()),
//               ),
//             ),
//
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                       child: Text(
//                         "Start your 7 days FREE trial to continue.".tr,
//                         textAlign: TextAlign.center,
//                         style: context.headlineMedium.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.blackMainTextColor,
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//
//                     SizedBox(
//                       height: 400,
//                       child: Assets.images.subscriationImageTwo.image(
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//
//                     const Gap(20),
//
//                     Opacity(
//                       opacity: .9,
//                       child: Transform.translate(
//                         offset: const Offset(0, -250),
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 24.0),
//                           padding: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             color: AppColors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withValues(alpha: .25),
//                                 blurRadius: 10,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Choose your Plan".tr,
//                                 style: context.titleLarge.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.blackMainTextColor,
//                                 ),
//                               ),
//                               const Gap(20),
//
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: _buildPlanOption(
//                                       index: 0,
//                                       title: "Monthly",
//                                       price: "\$2.19/mo",
//                                       showBadge: false,
//                                     ),
//                                   ),
//                                   const Gap(16),
//                                   Expanded(
//                                     child: _buildPlanOption(
//                                       index: 1,
//                                       title: "Yearly",
//                                       price: "\$20.99/yr",
//                                       showBadge: true,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 children: [
//                   CustomButton(
//                     text: "Purchase Now",
//                     onTap: () {
//                       AppRouter.route.goNamed(RoutePath.navigationPages);
//                     },
//                   ),
//                   const Gap(10),
//                   Text(
//                     "Just \$20.99 per year (1.99/month)", // Dynamic based on selection
//                     style: context.bodySmall.copyWith(
//                       color: AppColors.blackMainTextColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPlanOption({
//     required int index,
//     required String title,
//     required String price,
//     bool showBadge = false,
//   }) {
//     return ValueListenableBuilder<int>(
//       valueListenable: _selectedPlanIndex,
//       builder: (context, selectedIndex, _) {
//         final isSelected = selectedIndex == index;
//         return GestureDetector(
//           onTap: () => _selectedPlanIndex.value = index,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: AppColors.bgSecondaryButtonColor,
//                   border: Border.all(
//                     color: isSelected
//                         ? AppColors.blackMainTextColor
//                         : AppColors.linesDarkColor.withValues(alpha: .5),
//                     width: isSelected ? 2 : 1,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: context.titleMedium.copyWith(
//                         color: AppColors.blackMainTextColor,
//                       ),
//                     ),
//                     const Gap(8),
//                     Text(
//                       price,
//                       style: context.titleLarge.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.blackMainTextColor,
//                       ),
//                     ),
//                     const Gap(8),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Icon(
//                         isSelected
//                             ? Icons.check_circle
//                             : Icons.check_circle_outline,
//                         color: isSelected
//                             ? AppColors.blackMainTextColor
//                             : AppColors.linesDarkColor,
//                         size: 24,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (showBadge)
//                 Positioned(
//                   top: -12,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppColors.blackMainTextColor,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         "Save \$5.00",
//                         style: context.labelSmall.copyWith(
//                           color: AppColors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
