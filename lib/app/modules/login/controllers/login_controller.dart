import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final getStorage = GetStorage();

  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

 kliklogin(){
  getStorage.write("status", "login");
  Future.delayed(const Duration(seconds: 60),(){
        Get.offAllNamed(Routes.HOME);
      });
 }

  @override
  void onClose() {
    super.onClose();
  }
}
