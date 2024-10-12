import 'package:get/get.dart';
import 'package:mobile/app/modules/struktur/views/struktur_view.dart';

class StrukturController extends GetxController {
  //TODO: Implement StrukturController

  final count = 0.obs;
  var strukturList = <Struktur>[
    Struktur('Nama', 'Jabatan', '01-01-2024'),
    Struktur('Nama', 'Jabatan', '02-01-2024'),
    Struktur('Nama', 'Jabatan', '03-01-2024'),
    Struktur('Nama', 'Jabatan', '04-01-2024'),
  ].obs;

  void deleteStruktur(int index) {
    strukturList.removeAt(index);
  }

  void editStruktur(int index) {
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
