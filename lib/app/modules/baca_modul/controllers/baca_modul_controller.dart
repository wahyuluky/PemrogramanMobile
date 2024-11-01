import 'package:get/get.dart';

class BacaModulController extends GetxController {
  var currentPage = 1.obs;
  final totalPages = 10;

  List<String> hizbulWathanContent = [
    "Tentang Hizbul Wathan",
    "Sejarah Pendirian",
    "Visi dan Misi",
    "Prinsip-Prinsip Dasar",
    "Kegiatan-Kegiatan",
    "Peran dalam Pendidikan",
    "Nilai-nilai Dasar",
    "Struktur Organisasi",
    "Hubungan dengan Muhammadiyah",
    "Pentingnya Kepanduan"
  ];

  void nextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value++;
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }
}
