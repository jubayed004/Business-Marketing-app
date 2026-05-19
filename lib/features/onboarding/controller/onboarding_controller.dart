import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:som_spot/features/onboarding/model/onboarding_model.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: "assets/images/onboardone.png",
      title: AppStrings.onboardingOne,
      details: AppStrings.onboardingSubtitleOne,
    ),
    OnboardingModel(
      image: "assets/images/onboardtwo.png",
      title: AppStrings.onboardingTwo,
      details: AppStrings.onboardingSubtitleTwo,
    ),
    OnboardingModel(
      image: "assets/images/onboardthree.png",
      title: AppStrings.onboardingThree,
      details: AppStrings.onboardingSubtitleThree,
    ),
  ];
  PageController pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
