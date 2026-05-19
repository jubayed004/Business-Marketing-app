// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:health_tracker_app/core/router/route_path.dart';
// import 'package:health_tracker_app/core/router/routes.dart';
// import 'package:health_tracker_app/features/profile/controller/profile_controller.dart';
// import 'package:health_tracker_app/helper/toast/toast_helper.dart';
// import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
// import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
// import 'package:health_tracker_app/share/widgets/dropdown/custom_dropdown_field.dart';
// import 'package:health_tracker_app/share/widgets/text_field/custom_text_field.dart';
// import 'package:health_tracker_app/utils/color/app_colors.dart';
// import 'package:health_tracker_app/utils/extension/base_extension.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final controller = Get.put(ProfileController());
//   final _formKey = GlobalKey<FormState>();
//
//   // Text controllers with sample data
//   final TextEditingController nameController = TextEditingController(
//     text: 'Iris Rodriguez',
//   );
//   final TextEditingController genderController = TextEditingController(
//     text: 'Female',
//   );
//   final TextEditingController dobController = TextEditingController(
//     text: '10/12/94',
//   );
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     genderController.dispose();
//     dobController.dispose();
//     super.dispose();
//   }
//
//   // // Gender selection dialog
//   // void _showGenderPicker() {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     shape: const RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//   //     ),
//   //     builder: (context) {
//   //       return Container(
//   //         padding: const EdgeInsets.all(20),
//   //         child: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Text('Select Gender', style: context.titleLarge),
//   //             const Gap(20),
//   //             ListTile(
//   //               title: const Text('Male'),
//   //               onTap: () {
//   //                 genderController.text = 'Male';
//   //                 Navigator.pop(context);
//   //               },
//   //             ),
//   //             ListTile(
//   //               title: const Text('Female'),
//   //               onTap: () {
//   //                 genderController.text = 'Female';
//   //                 Navigator.pop(context);
//   //               },
//   //             ),
//   //             ListTile(
//   //               title: const Text('Other'),
//   //               onTap: () {
//   //                 genderController.text = 'Other';
//   //                 Navigator.pop(context);
//   //               },
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//
//   // Date picker dialog
//   void _showDatePicker() async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime(1994, 12, 10),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: AppColors.primaryColor,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (pickedDate != null) {
//       // Format the date as MM/DD/YY
//       final formattedDate =
//           '${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year.toString().substring(2)}';
//       dobController.text = formattedDate;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CircularArrowButton(onTap: () => Navigator.pop(context)),
//                       Expanded(
//                         child: Text(
//                           'Edit Profile',
//                           textAlign: TextAlign.center,
//                           style: context.titleLarge.copyWith(
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 48),
//                     ],
//                   ),
//                   const Gap(32),
//                   SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: Stack(
//                       children: [
//                         Positioned.fill(
//                           child: Obx(() {
//                             return ClipOval(
//                               child: controller.selectedImage.value != null
//                                   ? Image.file(
//                                       File(
//                                         controller.selectedImage.value!.path,
//                                       ),
//                                       fit: BoxFit.cover,
//                                     )
//                                   : Container(
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: AppColors.backgroundsLinesColor,
//                                         image: const DecorationImage(
//                                           image: NetworkImage(
//                                             'https://via.placeholder.com/150',
//                                           ),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                             );
//                           }),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: GestureDetector(
//                             onTap: () => controller.pickImage(),
//                             child: Container(
//                               height: 36,
//                               width: 36,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: AppColors.primaryColor,
//                               ),
//                               child: const Icon(
//                                 Icons.camera_alt_rounded,
//                                 color: AppColors.white,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Gap(32),
//
//                   CustomTextField(
//                     title: 'Name',
//                     controller: nameController,
//                     fillColor: AppColors.white,
//                     hintText: 'Enter your name',
//                     keyboardType: TextInputType.name,
//                   ),
//                   const Gap(16),
//
//                   CustomDropdownField(
//                     hintText: 'Select gender',
//                     value: "Male",
//                     onChanged: (value) {
//                       genderController.text = value!;
//                     },
//                     items: ["Male", "Female", "Other"],
//                   ),
//                   const Gap(16),
//
//                   CustomTextField(
//                     title: 'Date of Birth',
//                     controller: dobController,
//                     fillColor: AppColors.white,
//                     hintText: 'Select date',
//                     readOnly: true,
//                     onTap: _showDatePicker,
//                     suffixIcon: const Icon(
//                       Icons.calendar_today_rounded,
//                       color: AppColors.grayTertiaryTextColor,
//                       size: 20,
//                     ),
//                   ),
//                   const Gap(32),
//
//                   Obx(
//                     () => CustomButton(
//                       text: 'Update Profile',
//                       isLoading: controller.isUpdateLoading.value,
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           log('Name: ${nameController.text}');
//                           log('Gender: ${genderController.text}');
//                           log('DOB: ${dobController.text}');
//
//                           controller.isUpdateLoading.value = true;
//                           Future.delayed(const Duration(seconds: 2), () {
//                             controller.isUpdateLoading.value = false;
//                             AppToast.success(
//                               message: 'Profile updated successfully',
//                             );
//                             AppRouter.route.goNamed(RoutePath.navigationPages);
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
