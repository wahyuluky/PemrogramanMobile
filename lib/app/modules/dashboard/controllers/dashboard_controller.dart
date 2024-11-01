import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  
  // State untuk jumlah user dan leaderboard, bisa diupdate dari API misalnya
  var userCount = 35000.obs;
  var leaderboardCount = 35000.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
