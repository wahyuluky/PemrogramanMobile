import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/routes/app_pages.dart';


class OtpPageView extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPageView> {
  // Controller untuk OTP input
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE1D0), // Warna latar belakang sesuai gambar
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bagian Logo
            Image.asset(
              'assets/logo.png', // Sesuaikan dengan path logo
              height: 150,
            ),
            SizedBox(height: 30.0),

            // Judul OTP
            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),

            // Keterangan OTP
            Text(
              'An OTP has been sent to',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            Text(
              '+62 823 456 789 565',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30.0),

            // Input OTP - empat kolom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0),

            // Link untuk meminta kode lagi
            GestureDetector(
              onTap: () {
                // Aksi untuk request OTP lagi
              },
              child: Text(
                "Didn't get code?",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Aksi untuk request OTP lagi
              },
              child: Text(
                "Request again",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30.0),

            // Tombol Submit
            ElevatedButton(
              onPressed: () {
                // Aksi untuk submit OTP
                Get.toNamed(Routes.NOTIF_REGISTRASI);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF009944), // Warna hijau sesuai gambar
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: OtpPageView(),
    getPages: AppPages.routes,
  ));
}
