import 'package:get/get.dart';
import 'package:som_spot/features/auth/controller/auth_controller.dart';
import 'package:som_spot/features/onboarding/controller/onboarding_controller.dart';
import 'package:som_spot/share/controller/language_controller.dart';
import 'package:som_spot/utils/common_controller/common_controller.dart';


void initGetx() {
  //Auth
  Get.lazyPut(() => LanguageController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
/*  Get.lazyPut(() => OtherController(), fenix: true);*/
  Get.lazyPut(() => OnboardingController(), fenix: true);
  Get.lazyPut(() => CommonController(), fenix: true);
}
