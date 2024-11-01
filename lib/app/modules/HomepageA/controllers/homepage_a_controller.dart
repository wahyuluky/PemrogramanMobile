import 'package:get/get.dart';

class HomepageAController extends GetxController {
  //TODO: Implement HomepageAController

  var currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void changePage(int index){
    currentIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
}
