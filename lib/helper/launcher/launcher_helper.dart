import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:som_spot/helper/toast/toast_helper.dart';

class LauncherHelper {
  /// Launches the phone dialer with the specified [phoneNumber].
  static Future<void> launchPhoneDialer(BuildContext context, String phoneNumber) async {
    final Uri dialUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      if (await canLaunchUrl(dialUri)) {
        await launchUrl(dialUri);
      } else {
        if (context.mounted) {
          AppToast.info(
            context: context,
            message: "Dialer not supported on this device.",
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        AppToast.info(
          context: context,
          message: "Could not launch dialer: $e",
        );
      }
    }
  }

  /// Launches Google Maps with a query.
  static Future<void> launchGoogleMaps(String query) async {
    final encodedQuery = Uri.encodeComponent(query);
    final googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$encodedQuery");
    try {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint("Could not launch Google Maps: $e");
    }
  }

  /// Launches Apple Maps with a query.
  static Future<void> launchAppleMaps(String query) async {
    final encodedQuery = Uri.encodeComponent(query);
    final appleMapsUrl = Uri.parse("https://maps.apple.com/?q=$encodedQuery");
    try {
      await launchUrl(appleMapsUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint("Could not launch Apple Maps: $e");
    }
  }

  /// Shares merchant details using standard device sharing sheets.
  static Future<void> shareMerchant(BuildContext context, {required String title, required String category}) async {
    try {
      await Share.share(
        'Check out $title ($category) on SomSpot! Download the app now.',
        subject: 'SomSpot Merchant: $title',
      );
    } catch (e) {
      if (context.mounted) {
        AppToast.info(
          context: context,
          message: "Could not share merchant details: $e",
        );
      }
    }
  }

  /// Launches WhatsApp with the specified [phoneNumber].
  static Future<void> launchWhatsApp(BuildContext context, String phoneNumber) async {
    // Clean the phone number of all non-numeric characters
    final cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    final whatsAppUrl = Uri.parse("https://wa.me/$cleanPhoneNumber");
    try {
      // Launch directly without canLaunchUrl check because of package visibility restrictions on iOS/Android.
      final launched = await launchUrl(
        whatsAppUrl,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        if (context.mounted) {
          AppToast.info(
            context: context,
            message: "WhatsApp cannot be opened.",
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        AppToast.info(
          context: context,
          message: "Could not launch WhatsApp: $e",
        );
      }
    }
  }
}

