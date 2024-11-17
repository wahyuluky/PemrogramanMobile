import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DokumentasiController extends GetxController {
  var selectedImage = Rx<File?>(null); // File gambar yang dipilih
  var selectedVideo = Rx<File?>(null); // File video yang dipilih
  final ImagePicker _picker = ImagePicker(); // Instance ImagePicker

  // Fungsi untuk mengambil foto dari kamera
  Future<void> ambilFotoDariKamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // Fungsi untuk memilih foto dari galeri
  Future<void> ambilFotoDariGaleri() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // Fungsi untuk mengambil video dari kamera
  Future<void> ambilVideoDariKamera() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedVideo.value = File(pickedFile.path);
    }
  }

  // Fungsi untuk memilih video dari galeri
  Future<void> ambilVideoDariGaleri() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedVideo.value = File(pickedFile.path);
    }
  }

  // Reset gambar dan video yang diambil atau dipilih
  void resetMedia() {
    selectedImage.value = null;
    selectedVideo.value = null;
  }
}
