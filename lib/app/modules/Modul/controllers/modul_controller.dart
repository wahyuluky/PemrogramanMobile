import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/Modul/views/modul_view.dart';


class ModulController extends GetxController {
  //TODO: Implement ModulController
  final count = 0.obs;
   var modulList = <Modul>[
    Modul('Modul 1', 'Deskripsi Modul', '01-01-2024', 'orang'),
    Modul('Modul 2', 'Deskripsi Modul', '02-01-2024', 'orang'),
    Modul('Modul 3', 'Deskripsi Modul', '03-01-2024', 'orang'),
    Modul('Modul 4', 'Deskripsi Modul', '04-01-2024', 'orang'),
  ].obs;

  // Menggunakan GetX Observable List
  final titleController = TextEditingController();
  final penulisController = TextEditingController(); // Tambahkan penulisController
  final deskripsiController = TextEditingController();
  final isiModulController = TextEditingController();

  // Fungsi untuk menambah modul
  void addModul(String title, String penulis, String deskripsi, String isiModul) {
    modulList.add(Modul(title, penulis, deskripsi, isiModul));
  }

  // Fungsi untuk mengupdate modul
  void updateModul(int index, String title, String penulis, String deskripsi, String isiModul) {
    var updatedModul = Modul(title, penulis, deskripsi, isiModul);
    modulList[index] = updatedModul;
  }

  // Fungsi untuk menghapus modul
  void deleteModul(int index) {
    modulList.removeAt(index);
  }

  void editModul(int index) {
    // Logika edit modul di sini
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
