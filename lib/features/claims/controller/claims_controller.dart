import 'package:get/get.dart';

class ClaimItem {
  final String id;
  final String businessName;
  final String businessImage;
  final String title;
  final String expireDate;
  final String claimCode;
  final bool isActive;

  ClaimItem({
    required this.id,
    required this.businessName,
    required this.businessImage,
    required this.title,
    required this.expireDate,
    required this.claimCode,
    this.isActive = true,
  });
}

class ClaimsController extends GetxController {
  // Selected tab index: 0 for Active, 1 for Expired
  final tabIndex = 0.obs;

  // Mock Active Claims
  final activeClaims = <ClaimItem>[
    ClaimItem(
      id: "1",
      businessName: "Hilib Macaan Restaurant",
      businessImage: "https://images.unsplash.com/photo-1544025162-d76694265947?q=80&w=200&auto=format&fit=crop",
      title: "20% Off Family Platter",
      expireDate: "Expires: 25 May 2026",
      claimCode: "SOM-842",
      isActive: true,
    ),
    ClaimItem(
      id: "2",
      businessName: "Safa Pharmacy",
      businessImage: "https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=200&auto=format&fit=crop",
      title: "10% Off All Prescriptions",
      expireDate: "Expires: 28 May 2026",
      claimCode: "SOM-931",
      isActive: true,
    ),
    ClaimItem(
      id: "3",
      businessName: "Mogadishu Coffee",
      businessImage: "https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=200&auto=format&fit=crop",
      title: "Buy 1 Get 1 Free Espresso",
      expireDate: "Expires: 30 May 2026",
      claimCode: "SOM-105",
      isActive: true,
    ),
  ].obs;

  // Mock Expired Claims
  final expiredClaims = <ClaimItem>[
    ClaimItem(
      id: "4",
      businessName: "City Supermarket",
      businessImage: "https://images.unsplash.com/photo-1578916171728-46686eac8d58?q=80&w=200&auto=format&fit=crop",
      title: "\$10 Off Grocery Purchase",
      expireDate: "Expired: 10 May 2026",
      claimCode: "SOM-004",
      isActive: false,
    ),
    ClaimItem(
      id: "5",
      businessName: "Somali Electronics",
      businessImage: "https://images.unsplash.com/photo-1498049794561-7780e7231661?q=80&w=200&auto=format&fit=crop",
      title: "5% Off Mobile Accessories",
      expireDate: "Expired: 02 May 2026",
      claimCode: "SOM-009",
      isActive: false,
    ),
  ].obs;

  void changeTab(int index) {
    tabIndex.value = index;
  }
}
