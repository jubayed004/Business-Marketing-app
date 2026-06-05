import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';

class OfferController extends GetxController {
  static OfferController get to => Get.find();

  final ImagePicker _picker = ImagePicker();
  RxString imagePath = ''.obs;

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path;
      }
    } catch (e) {
      AppToast.error(message: 'Failed to pick image');
    }
  }

  void clearImage() {
    imagePath.value = '';
  }
}
