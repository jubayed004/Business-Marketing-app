// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:health_tracker_app/core/router/route_path.dart';
// import 'package:health_tracker_app/core/router/routes.dart';
// import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
// import 'package:health_tracker_app/utils/color/app_colors.dart';
// import 'package:health_tracker_app/utils/extension/base_extension.dart';
//
// class SettingScreen extends StatelessWidget {
//   const SettingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   CircularArrowButton(onTap: () => Navigator.pop(context)),
//                   Expanded(
//                     child: Text(
//                       'Settings',
//                       textAlign: TextAlign.center,
//                       style: context.titleLarge.copyWith(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 48),
//                 ],
//               ),
//               const Gap(32),
//               _buildSettingItem(
//                 context: context,
//                 icon: Icons.lock_outline,
//                 iconBackgroundColor: const Color(0xFFEDE7F6),
//                 iconColor: AppColors.primaryColor,
//                 title: 'Change Password',
//                 onTap: () {
//                   AppRouter.route.pushNamed(RoutePath.changePasswordScreen);
//                 },
//               ),
//               const Gap(12),
//
//               _buildSettingItem(
//                 context: context,
//                 icon: Icons.attach_money_rounded,
//                 iconBackgroundColor: const Color(0xFFEDE7F6),
//                 iconColor: AppColors.primaryColor,
//                 title: 'Subscription',
//                 onTap: () {
//                   AppRouter.route.pushNamed(RoutePath.subscriptionScreen);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSettingItem({
//     required BuildContext context,
//     required IconData icon,
//     required Color iconBackgroundColor,
//     required Color iconColor,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: iconBackgroundColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Icon(icon, color: iconColor, size: 22),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 title,
//                 style: context.bodyLarge.copyWith(fontWeight: FontWeight.w500),
//               ),
//             ),
//             Icon(
//               Icons.arrow_forward_ios,
//               size: 16,
//               color: AppColors.grayTertiaryTextColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
