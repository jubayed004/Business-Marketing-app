import 'package:get/get.dart';

class NotificationModel {
  final String title;
  final String description;
  final String time;
  final RxBool isUnread;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required bool isUnread,
  }) : isUnread = isUnread.obs;
}

class AlertsScreenController extends GetxController {
  // Feed list
  final rxNotifications = <NotificationModel>[
    NotificationModel(
      title: "New deal at Hilib Macaan",
      description: "20% off family platter — claim before it ends.",
      time: "5m ago",
      isUnread: true,
    ),
    NotificationModel(
      title: "Liido Beach Cafe reviewed",
      description: "A new 5-star review just came in.",
      time: "1h ago",
      isUnread: true,
    ),
    NotificationModel(
      title: "Offer claimed successfully",
      description: "Your coffee combo is ready to redeem.",
      time: "3h ago",
      isUnread: false,
    ),
    NotificationModel(
      title: "Welcome to SomSpot",
      description: "Discover local deals near you anytime.",
      time: "2d ago",
      isUnread: false,
    ),
  ].obs;

  void markAllAsRead() {
    for (var notification in rxNotifications) {
      notification.isUnread.value = false;
    }
  }

  void toggleUnread(int index) {
    rxNotifications[index].isUnread.toggle();
  }
}
