import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:som_spot/core/router/route_path.dart';
import 'package:som_spot/core/router/routes.dart';
import 'package:som_spot/share/widgets/button/custom_button.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';
import 'package:som_spot/utils/color/app_colors.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

class ActiveOtpScreen extends StatefulWidget {
  const ActiveOtpScreen({super.key});

  @override
  State<ActiveOtpScreen> createState() => _ActiveOtpScreenState();
}

class _ActiveOtpScreenState extends State<ActiveOtpScreen> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: context.headlineSmall.copyWith(
        color: AppColors.darkTextColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.linesDarkColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              // ── Back Button ──
              GestureDetector(
                onTap: () => AppRouter.route.pop(),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.darkTextColor,
                  size: 20,
                ),
              ),
              const Gap(24),

              // ── Title ──
              Text(
                AppStrings.verifyYourPhone.tr,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTextColor,
                ),
              ),
              const Gap(8),

              // ── Subtitle ──
              RichText(
                text: TextSpan(
                  style: context.bodyLarge.copyWith(
                    color: AppColors.subtitleTextColor,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: '${AppStrings.weSentCode.tr} '),
                    const TextSpan(
                      text: '+252 61 234 5678', // Replace with dynamic number
                      style: TextStyle(
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(40),

              // ── Form ──
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.enterVerificationCode.tr,
                        style: context.bodyLarge.copyWith(
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(16),

                      // ── Pinput ──
                      Center(
                        child: Pinput(
                          controller: _pinController,
                          length: 6, // 6 boxes as shown in the screenshot
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) {
                            // Automatically submit when complete
                          },
                        ),
                      ),
                      const Gap(24),

                      // ── Resend Code ──
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: context.bodyMedium.copyWith(
                              color: AppColors.subtitleTextColor,
                            ),
                            children: [
                              TextSpan(text: '${AppStrings.resendCodeIn.tr} '),
                              const TextSpan(
                                text: '0:33', // Static for now, can use a timer
                                style: TextStyle(
                                  color: AppColors.darkTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(40),

                      // ── Verify & Continue Button ──
                      CustomButton(
                        text: AppStrings.verifyAndContinue.tr,
                        onTap: () {
                          // Usually goes to create new password or home depending on flow
                          AppRouter.route.pushNamed(
                            RoutePath.resetPasswordScreen,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
