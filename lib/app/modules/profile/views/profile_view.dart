import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan MediaQuery untuk mendapatkan ukuran layar

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDE1D0),
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Stack untuk menampilkan avatar dengan icon edit
            Stack(
              children: [
                CircleAvatar(
                  radius: 50.0, // Ukuran avatar disesuaikan dengan lebar layar
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.person,
                    size: 40.0, // Ikon di dalam avatar disesuaikan
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 20.0, // Ukuran lingkaran edit
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20), // Spasi dinamis

            // Menggunakan fungsi buildProfileItem untuk setiap item
            buildProfileItem(context, 'Username'),
            buildProfileItem(context, 'Email Address'),
            buildProfileItem(context, 'Phone Number'),
            buildProfileItem(context, 'Address'),

            SizedBox(height: 10.0), // Spasi dinamis

            // Tombol-tombol Profile
            buildProfileButton(context, 'History', Icons.arrow_right),
            buildProfileButton(context, 'Sertifikat', Icons.arrow_right),
            buildProfileButton(context, 'Logout', Icons.arrow_right),
          ],
        ),
      ),
      
    );
  }

  // Menggunakan lebar layar untuk menyesuaikan padding dan spasi
  Widget buildProfileItem(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.0, // Ukuran font dinamis
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Icon(Icons.edit), // Ukuran icon dinamis
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade400,
        ),
        SizedBox(height: 10.0), // Spasi dinamis
      ],
    );
  }

  Widget buildProfileButton(BuildContext context, String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0), // Margin dinamis
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF009D44),
          padding: EdgeInsets.symmetric(vertical: 15.0), // Padding dinamis
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0, // Ukuran teks dinamis
                color: Colors.white,
              ),
            ),
            Icon(icon, color: Colors.white), // Ukuran icon dinamis
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileView(),
  ));
}
