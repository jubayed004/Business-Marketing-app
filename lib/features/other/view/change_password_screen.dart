// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:health_tracker_app/core/router/route_path.dart';
// import 'package:health_tracker_app/core/router/routes.dart';
// import 'package:health_tracker_app/features/auth/controller/auth_controller.dart';
// import 'package:health_tracker_app/helper/validator/text_field_validator.dart';
// import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
// import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
// import 'package:health_tracker_app/share/widgets/text_field/custom_text_field.dart';
// import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
// import 'package:health_tracker_app/utils/extension/base_extension.dart';
// import 'package:iconsax/iconsax.dart';
//
// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({super.key});
//
//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }
//
// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _oldPassword = TextEditingController();
//   final TextEditingController _resetPassword = TextEditingController();
//   final TextEditingController _resetConfirmPassword = TextEditingController();
//   final AuthController _auth = Get.find<AuthController>();
//
//   @override
//   void dispose() {
//     _resetConfirmPassword.dispose();
//     _resetPassword.dispose();
//     _oldPassword.dispose();
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
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//           child: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CircularArrowButton(
//                               onTap: () => Navigator.pop(context),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'Change Password',
//                                 textAlign: TextAlign.center,
//                                 style: context.titleLarge.copyWith(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 48),
//                           ],
//                         ),
//                         const Gap(32),
//
//                         /// ---------- Old Password Input ----------
//                         CustomTextField(
//                           title: "Old Password".tr,
//                           hintText: AppStrings.enterPassword.tr,
//                           keyboardType: TextInputType.text,
//                           prefixIcon: Icon(Iconsax.lock_1),
//                           isPassword: true,
//                           controller: _oldPassword,
//                           validator: TextFieldValidator.password(),
//                           onChanged: (value) {
//                             _auth.password.value = value;
//                           },
//                         ),
//                         Gap(16.h),
//
//                         /// ---------- New Password Input ----------
//                         CustomTextField(
//                           title: AppStrings.newPassword.tr,
//                           hintText: AppStrings.enterPassword.tr,
//                           keyboardType: TextInputType.text,
//                           prefixIcon: Icon(Iconsax.lock_1),
//                           isPassword: true,
//                           controller: _resetPassword,
//                           validator: TextFieldValidator.password(),
//                           onChanged: (value) {
//                             _auth.password.value = value;
//                           },
//                         ),
//                         Gap(16.h),
//
//                         /// ---------- Confirm Password ----------
//                         CustomTextField(
//                           title: AppStrings.confirmPassword.tr,
//                           hintText: AppStrings.enterConfirmPassword.tr,
//                           keyboardType: TextInputType.text,
//                           prefixIcon: Icon(Iconsax.lock_1),
//                           isPassword: true,
//                           controller: _resetConfirmPassword,
//                           validator: TextFieldValidator.confirmPassword(
//                             _resetPassword,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               CustomButton(
//                 text: "Change Password".tr,
//                 onTap: () => AppRouter.route.goNamed(RoutePath.navigationPages),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
