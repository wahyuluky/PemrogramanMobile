import 'package:get/get.dart';

class PresensiController extends GetxController {
  //TODO: Implement PresensiController

  final count = 0.obs;
  var presensiList = [
    {'name': 'Nama Anggota', 'status': 'Hadir'},
    {'name': 'Nama Anggota', 'status': 'Hadir'},
    {'name': 'Nama Anggota', 'status': 'Absen'},
    {'name': 'Nama Anggota', 'status': 'Hadir'},
    {'name': 'Nama Anggota', 'status': 'Absen'},
  ].obs;

  void deletePresensi(int index) {
    presensiList.removeAt(index);
  }

  void editPresensi(int index) {
    // Logika untuk mengedit presensi
  }

  void downloadPDF() {
    // Logika untuk unduh PDF
  }

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
