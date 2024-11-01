import 'package:get/get.dart';
import 'package:mobile/app/modules/biodata/views/biodata_view.dart';
class BiodataController extends GetxController {
  //TODO: Implement BiodataController

  final count = 0.obs;
  var biodataList = <Biodata>[
    Biodata('Biodata 1', 'assets/profile.jpg'),
    Biodata('Biodata 2', 'assets/profile.jpg'),
    Biodata('Biodata 3', 'assets/profile.jpg'),
    Biodata('Biodata 4', 'assets/profile.jpg'),
  ].obs;

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
