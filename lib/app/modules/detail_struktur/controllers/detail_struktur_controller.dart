
import 'package:get/get.dart';

class DetailStrukturController extends GetxController {
  //TODO: Implement DetailStrukturController

  // Sample data for the detail view
 var person = <String, dynamic>{
    'name': 'Cipung Abubu',
    'position': 'Ketua Umum',
    'period': '2024/2025',
    'tasks': [
      'Mengatur kegiatan organisasi',
      'Mengawasi jalannya program',
      'Membuat laporan tahunan',
      'Mengelola sumber daya organisasi',
      'Mengadakan rapat rutin',
      'Membangun hubungan antaranggota',
      'Menyusun strategi organisasi',
    ]
  }.obs;

  
}
