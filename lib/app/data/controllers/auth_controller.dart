// lib/controllers/auth_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  final storage = FlutterSecureStorage();

  // TextEditingControllers untuk input pengguna
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observables untuk state loading dan error
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Fungsi login
  Future<void> login() async {
    String email = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Email dan Password tidak boleh kosong.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      Map<String, dynamic> response = await _apiService.login(email, password);

      if (response.containsKey('token')) {
        // Simpan token dengan aman
        await storage.write(key: 'token', value: response['token']);
        // Navigasi ke halaman utama
        Get.offNamed('/homepage-a');
      } else if (response.containsKey('error')) {
        errorMessage.value = response['error'];
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
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
