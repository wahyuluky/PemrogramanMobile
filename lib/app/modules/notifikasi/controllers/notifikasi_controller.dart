import 'package:get/get.dart';

class NotifikasiController extends GetxController {
  //TODO: Implement NotifikasiController

  final count = 0.obs;
  var notifikasiList = [
    {'title': 'Modul 1', 'description': 'Deskripsi Modul', 'date': 'date'},
    {'title': 'Kegiatan 1', 'description': 'Deskripsi Modul', 'date': 'date'},
    {'title': 'Modul 2', 'description': 'Deskripsi Modul', 'date': 'date'},
    {'title': 'Kegiatan 2', 'description': 'Deskripsi Modul', 'date': 'date'},
    {'title': 'Modul 3', 'description': 'Deskripsi Modul', 'date': 'date'},
    {'title': 'Kegiatan 3', 'description': 'Deskripsi Modul', 'date': 'date'},
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
