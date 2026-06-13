import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';
import 'package:som_spot/utils/app_strings/app_strings.dart';

class CompletedProfileController extends GetxController {
  // ── Step Navigation ──
  final currentStep = 0.obs;
  final pageController = PageController();
  static const int totalSteps = 5;

  // ── Step 1: Business Info ──
  final businessNameController = TextEditingController();
  final shortDescriptionController = TextEditingController();
  final selectedCategory = "".obs;

  // ── Step 1: Location ──
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final mapController = MapController();
  // Default: Aqua Tower, Mohakhali, Dhaka
  final selectedLatLng = const LatLng(23.78081, 90.40749).obs;

  // ── Step 2: Business Hours ──
  final businessHours = <String, Map<String, dynamic>>{}.obs;

  // ── Step 3: Branding ──
  final coverImagePath = Rx<String?>(null);
  final logoImagePath = Rx<String?>(null);
  final _picker = ImagePicker();

  // ── Step 4: Contact ──
  final phoneController = TextEditingController();
  final whatsAppController = TextEditingController();
  final sameAsPhone = false.obs;

  // ── Loading ──
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initBusinessHours();

    // Sync WhatsApp with phone when "same as phone" is toggled
    ever(sameAsPhone, (bool value) {
      if (value) {
        whatsAppController.text = phoneController.text;
      }
    });
  }

  void _initBusinessHours() {
    final days = [
      AppStrings.monday,
      AppStrings.tuesday,
      AppStrings.wednesday,
      AppStrings.thursday,
      AppStrings.friday,
      AppStrings.saturday,
      AppStrings.sunday,
    ];

    for (final day in days) {
      businessHours[day] = {
        'isOpen': true,
        'openTime': const TimeOfDay(hour: 9, minute: 0),
        'closeTime': const TimeOfDay(hour: 17, minute: 0),
      };
    }
    // Saturday & Sunday default to closed
    businessHours[AppStrings.saturday] = {
      'isOpen': false,
      'openTime': const TimeOfDay(hour: 9, minute: 0),
      'closeTime': const TimeOfDay(hour: 17, minute: 0),
    };
    businessHours[AppStrings.sunday] = {
      'isOpen': false,
      'openTime': const TimeOfDay(hour: 9, minute: 0),
      'closeTime': const TimeOfDay(hour: 17, minute: 0),
    };
  }

  // ── Navigation ──
  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  // ── Business Hours ──
  void toggleDayOpen(String day) {
    final current = businessHours[day]!;
    businessHours[day] = {
      ...current,
      'isOpen': !(current['isOpen'] as bool),
    };
    businessHours.refresh();
  }

  void updateOpenTime(String day, TimeOfDay time) {
    final current = businessHours[day]!;
    businessHours[day] = {
      ...current,
      'openTime': time,
    };
    businessHours.refresh();
  }

  void updateCloseTime(String day, TimeOfDay time) {
    final current = businessHours[day]!;
    businessHours[day] = {
      ...current,
      'closeTime': time,
    };
    businessHours.refresh();
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  // ── Image Picking ──
  Future<void> pickCoverImage() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );
    if (picked != null) {
      coverImagePath.value = picked.path;
    }
  }

  Future<void> pickLogoImage() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 90,
    );
    if (picked != null) {
      logoImagePath.value = picked.path;
    }
  }

  // ── Map ──
  final isMapSearching = false.obs;

  void updateMapPosition(LatLng latLng) {
    selectedLatLng.value = latLng;
    mapController.move(latLng, mapController.camera.zoom);
  }

  Future<void> searchLocationFromAddress() async {
    final street = addressController.text.trim();
    final city = cityController.text.trim();

    if (street.isEmpty && city.isEmpty) {
      AppToast.warning(message: AppStrings.pleaseEnterAddressToSearch.tr);
      return;
    }

    final queryParts = <String>[];
    if (street.isNotEmpty) queryParts.add(street);
    if (city.isNotEmpty) queryParts.add(city);
    final query = queryParts.join(', ');

    try {
      isMapSearching.value = true;
      final dio = Dio();
      final response = await dio.get(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'q': query,
          'format': 'json',
          'limit': 1,
        },
        options: Options(
          headers: {
            'User-Agent': 'som_spot/1.0',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data is List && data.isNotEmpty) {
          final firstResult = data[0];
          final lat = double.tryParse(firstResult['lat'].toString());
          final lon = double.tryParse(firstResult['lon'].toString());
          if (lat != null && lon != null) {
            final latLng = LatLng(lat, lon);
            updateMapPosition(latLng);
            AppToast.success(message: AppStrings.locationUpdatedOnMap.tr);
          } else {
            AppToast.error(message: AppStrings.noLocationMatchesFound.tr);
          }
        } else {
          AppToast.error(message: AppStrings.noLocationMatchesFound.tr);
        }
      } else {
        AppToast.error(message: AppStrings.errorSearchingLocation.tr);
      }
    } catch (e) {
      AppToast.error(message: AppStrings.errorSearchingLocation.tr);
    } finally {
      isMapSearching.value = false;
    }
  }

  // ── Search Suggestions ──
  Timer? _debounce;
  final suggestions = <Map<String, dynamic>>[].obs;
  final isSearchingSuggestions = false.obs;
  bool _isSelectingSuggestion = false;

  void onAddressChanged(String query) {
    if (_isSelectingSuggestion) return;

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (query.trim().length > 2) {
        fetchSuggestions(query);
      } else {
        suggestions.clear();
      }
    });
  }

  Future<void> fetchSuggestions(String query) async {
    try {
      isSearchingSuggestions.value = true;
      final dio = Dio();
      final response = await dio.get(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'q': query,
          'format': 'json',
          'limit': 5,
          'addressdetails': 1,
        },
        options: Options(
          headers: {
            'User-Agent': 'som_spot/1.0',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data is List) {
          suggestions.value = List<Map<String, dynamic>>.from(data);
        }
      }
    } catch (e) {
      // Fail silently to not disrupt typing
    } finally {

      
      isSearchingSuggestions.value = false;
    }
  }

  void selectSuggestion(Map<String, dynamic> suggestion) {
    _isSelectingSuggestion = true;

    final displayName = suggestion['display_name'] ?? '';
    final address = suggestion['address'] as Map<String, dynamic>?;

    addressController.text = displayName;

    if (address != null) {
      final city = address['city'] ??
          address['town'] ??
          address['village'] ??
          address['suburb'] ??
          address['state'] ??
          '';
      cityController.text = city.toString();
    }

    suggestions.clear();

    final lat = double.tryParse(suggestion['lat'].toString());
    final lon = double.tryParse(suggestion['lon'].toString());
    if (lat != null && lon != null) {
      updateMapPosition(LatLng(lat, lon));
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      _isSelectingSuggestion = false;
    });
  }

  // ── Phone sync ──
  void syncWhatsApp() {
    if (sameAsPhone.value) {
      whatsAppController.text = phoneController.text;
    }
  }

  // ── Finish Setup ──
  Future<void> finishSetup() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }

  @override
  void onClose() {
    _debounce?.cancel();
    pageController.dispose();
    mapController.dispose();
    businessNameController.dispose();
    shortDescriptionController.dispose();
    addressController.dispose();
    cityController.dispose();
    phoneController.dispose();
    whatsAppController.dispose();
    super.onClose();
  }
}
