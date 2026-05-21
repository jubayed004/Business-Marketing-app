import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';
import 'package:som_spot/helper/validator/text_field_validator.dart';
import 'package:som_spot/share/widgets/button/custom_button.dart';
import 'package:som_spot/share/widgets/text_field/custom_text_field.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _isSubmitting = false.obs;

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _isSubmitting.value = true;

      // Simulate submission delay
      Future.delayed(const Duration(seconds: 1), () {
        _isSubmitting.value = false;
        _subjectController.clear();
        _messageController.clear();

        AppToast.success(
          message: AppStrings.messageSubmitted.tr,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.helpSupport.tr,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppColors.darkTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Support Form Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.backgroundsLinesColor.withValues(
                      alpha: 0.8,
                    ),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.01),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.sendUsMessage.tr,
                        style: context.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: AppColors.darkTextColor,
                        ),
                      ),
                      Gap(16.h),

                      // Subject TextField
                      CustomTextField(
                        title: AppStrings.subject.tr,
                        controller: _subjectController,
                        fillColor: AppColors.white,
                        hintText: AppStrings.enterSubject.tr,
                        validator: TextFieldValidator.required(
                          errorText: AppStrings.subjectRequired.tr,
                        ),
                      ),
                      Gap(16.h),

                      // Message TextField
                      CustomTextField(
                        title: AppStrings.messageDesc.tr,
                        controller: _messageController,
                        fillColor: AppColors.white,
                        hintText: AppStrings.describeIssue.tr,
                        maxLines: 4,
                        minLines: 4,
                        validator: TextFieldValidator.required(
                          errorText: AppStrings.messageEmpty.tr,
                        ),
                      ),
                      Gap(20.h),

                      // Submit button
                      Obx(
                        () => CustomButton(
                          text: AppStrings.submitMessage.tr,
                          isLoading: _isSubmitting.value,
                          onTap: _submitForm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(28.h),

              // FAQ Header
              Text(
                AppStrings.faq.tr,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.darkTextColor,
                ),
              ),
              Gap(12.h),

              // FAQ List
              _buildFaqItem(
                question: "How do I claim a deal on SomSpot?",
                answer: "Go to any active offer on the Home or Saved screen, tap on the 'Claim' button. The coupon will be added to your My Claims list where you can click 'View' to present the QR code to the merchant to redeem.",
              ),
              _buildFaqItem(
                question: "How long are deals valid?",
                answer: "Each deal has a specific expiry date indicated on its detail page and card (e.g. 'Expires: 25 May 2026'). Make sure to redeem the deal before the timer or date runs out.",
              ),
              _buildFaqItem(
                question: "Is SomSpot free to use?",
                answer: "Yes, SomSpot is 100% free for customers to discover nearby businesses, browse promotional discounts, and claim deals.",
              ),
              _buildFaqItem(
                question: "Can I cancel a claimed deal?",
                answer: "Claimed deals will automatically expire if they are not used within their validity period. There is no need to manually cancel or remove them.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.backgroundsLinesColor.withValues(alpha: 0.8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 4.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.primaryColor,
          collapsedIconColor: AppColors.hintTextColor,
          tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
          childrenPadding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          title: Text(
            question,
            style: context.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              color: AppColors.darkTextColor,
            ),
          ),
          children: [
            Text(
              answer,
              style: context.bodyMedium.copyWith(
                color: AppColors.subtitleTextColor,
                fontSize: 12.sp,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
