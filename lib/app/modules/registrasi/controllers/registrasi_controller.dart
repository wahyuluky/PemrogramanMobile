import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/data/services/api_services.dart';
import 'package:mobile/app/data/models/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class RegistrasiController extends GetxController {
  //TODO: Implement RegistrasiController

  final count = 0.obs;
  // lib/controllers/registrasi_controller.dart
  final ApiService _apiService = ApiService();
  final storage = FlutterSecureStorage();

  // TextEditingControllers untuk input pengguna
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Observables untuk state loading dan error
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Fungsi registrasi
  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Validasi input
    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      errorMessage.value = 'Semua field harus diisi.';
      return;
    }

    if (!GetUtils.isEmail(email)) {
      errorMessage.value = 'Email tidak valid.';
      return;
    }

    if (password.length < 6) {
      errorMessage.value = 'Password minimal 6 karakter.';
      return;
    }

    if (password != confirmPassword) {
      errorMessage.value = 'Password tidak cocok.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      AuthResponse response = await _apiService.register(email, password);

      if (response.token != null && response.id != null) {
        // Simpan token dengan aman
        await storage.write(key: 'token', value: response.token);
        // Navigasi ke halaman utama atau OTP page jika diperlukan
        Get.offNamed('/otp-page');
        // Jika langsung ke HomePage, gunakan:
        // Get.off(() => HomeView());
      } else if (response.error != null) {
        errorMessage.value = response.error!;
      } else {
        errorMessage.value = 'Terjadi kesalahan. Silakan coba lagi.';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose controllers ketika tidak diperlukan
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


  void increment() => count.value++;
}
