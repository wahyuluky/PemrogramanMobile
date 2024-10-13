import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/data/controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  // Mendapatkan instance AuthController
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // Mengatur tampilan sistem UI
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFEDE1D0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 80.0,
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Enter your username and password to login",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              // Username (Email) TextField
              TextField(
                controller: authController.usernameController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // Password TextField
              TextField(
                controller: authController.passwordController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black54,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // Menampilkan pesan error jika ada
              Obx(() => authController.errorMessage.value.isNotEmpty
                  ? Text(
                      authController.errorMessage.value,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    )
                  : SizedBox()),
              // Button Login
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                child: InkWell(
                  onTap: () {
                    authController.login();
                  },
                  child: SizedBox(
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Color.fromARGB(255, 30, 173, 42),
                      color: Color.fromARGB(255, 9, 92, 27),
                      elevation: 7.0,
                      child: Center(
                        child: Obx(() => authController.isLoading.value
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Montserrat",
                                ),
                              )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Link ke halaman registrasi
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/registrasi'); // Aksi untuk berpindah ke halaman registrasi
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "   Register",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginView(),
    getPages: AppPages.routes,
  ));
}