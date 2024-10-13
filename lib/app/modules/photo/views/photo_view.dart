import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/routes/app_pages.dart';

class PhotoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE1D0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo at the top
            Image.asset(
              "assets/logo.png", // Ganti dengan path logo yang benar
              height: 100.0,
            ),
            SizedBox(height: 30.0),

            // Register title
            Text(
              "Register",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30.0),

            // Take Photo icon and button
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person_outline,
                size: 50.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Add action to take a photo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF009D44), // Hijau
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Take Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),

            // Upload Photo icon and button
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person_outline,
                size: 50.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Add action to upload a photo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF009D44), // Hijau
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Upload Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),

            // Buttons Upload and Skip
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add action for upload
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Hitam untuk Upload
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Upload",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                OutlinedButton(
                  onPressed: () {
                    // Add action for skip
                    Get.toNamed(Routes.HOMEPAGE_A);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
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
    home: PhotoView(),
    getPages: AppPages.routes,
  ));
}

