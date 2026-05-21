import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:som_spot/core/router/route_path.dart';
import 'package:som_spot/core/router/routes.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';

class ProfileScreenController extends GetxController {
  // User Profile details
  final userName = "Abdul Karim".obs;
  final userEmail = "example.mail.com".obs;
  final userPhone = "+252 61 5000000".obs;
  final userAvatar =
      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=150&auto=format&fit=crop"
          .obs;

  // Selected local image path
  final selectedImage = RxnString();

  // Loading states
  final isUpdateLoading = false.obs;

  // Statistics
  final savedCount = 12.obs;
  final claimsCount = 8.obs;
  final reviewsCount = 5.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        selectedImage.value = image.path;
      }
    } catch (e) {
      AppToast.error(message: "Failed to pick image: $e");
    }
  }

  void updateProfile({required String name, required String phone}) {
    isUpdateLoading.value = true;

    // Simulate API update
    Future.delayed(const Duration(seconds: 1), () {
      userName.value = name;
      userPhone.value = phone;
      if (selectedImage.value != null) {
        userAvatar.value = selectedImage.value!;
      }
      isUpdateLoading.value = false;

      AppToast.success(message: "Profile updated successfully!");
    });
  }

  void logout() {
    AppToast.success(message: "You have successfully logged out.");
    AppRouter.route.goNamed(RoutePath.loginScreen);
  }
}
