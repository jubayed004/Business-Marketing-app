// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:health_tracker_app/core/router/routes.dart';
// import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
// import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
// import 'package:health_tracker_app/share/widgets/text_field/custom_text_field.dart';
// import 'package:health_tracker_app/utils/extension/base_extension.dart';
//
// class ContactAndSupportScreen extends StatefulWidget {
//   const ContactAndSupportScreen({super.key});
//
//   @override
//   State<ContactAndSupportScreen> createState() =>
//       _ContactAndSupportScreenState();
// }
//
// class _ContactAndSupportScreenState extends State<ContactAndSupportScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//           child: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CircularArrowButton(
//                             onTap: () => Navigator.pop(context),
//                           ),
//                           Expanded(
//                             child: Text(
//                               'Contact & Support',
//                               textAlign: TextAlign.center,
//                               style: context.titleLarge.copyWith(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 48),
//                         ],
//                       ),
//                       const Gap(32),
//
//                       /// Name Input
//                       CustomTextField(
//                         title: "Enter Name",
//                         hintText: "Enter Your Name",
//                         controller: _nameController,
//                         fillColor: const Color(0xFFF9F9F9), // Light grey fill
//                       ),
//                       Gap(16.h),
//
//                       /// Email Input
//                       CustomTextField(
//                         title: " Email Address",
//                         hintText: "Enter Email Address",
//                         controller: _emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         fillColor: const Color(0xFFF9F9F9),
//                       ),
//                       Gap(16.h),
//
//                       /// Message Input
//                       CustomTextField(
//                         title: "Write here",
//                         hintText: "Write here...",
//                         controller: _messageController,
//                         maxLines: 6,
//                         fillColor: const Color(0xFFF9F9F9),
//                       ),
//                       Gap(32.h),
//                     ],
//                   ),
//                 ),
//               ),
//               CustomButton(
//                 text: "Submit", // Changed from "Change Password" as per plan
//                 onTap: () {
//                   AppRouter.route.pop();
//                 },
//               ),
//               Gap(24.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
