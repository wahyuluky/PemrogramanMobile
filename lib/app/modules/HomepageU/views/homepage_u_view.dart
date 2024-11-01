import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/Modul/views/modul_view.dart';
import 'package:mobile/app/modules/jadwal_u/views/jadwal_u_view.dart';
import 'package:mobile/app/modules/leaderboard/views/leaderboard_view.dart';
import 'package:mobile/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:mobile/app/modules/presensi/views/presensi_view.dart';
import 'package:mobile/app/modules/profile/views/profile_view.dart';
import 'package:mobile/app/modules/schedule/views/schedule_view.dart';
import 'package:mobile/app/modules/struktur/views/struktur_view.dart';
import '../controllers/homepage_u_controller.dart';

class HomepageUView extends GetView<HomepageUController> {
  @override
  Widget build(BuildContext context) {
    final HomepageUController controller = Get.put(HomepageUController());

    return Scaffold(
      backgroundColor: Color(0xFFEDE1D0),
      body: SafeArea(
        child: Obx(() => IndexedStack(
              index: controller.currentIndex.value,
              children: [
                DashboardPage(),
                StrukturView(),
                JadwalUView(),
                NotifikasiView(),
                ProfileView(),
              ],
            )),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePage, // Memanggil fungsi changePage di controller
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: controller.currentIndex.value == 0 ? Colors.green : Colors.grey),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view, color: controller.currentIndex.value == 1 ? Colors.green : Colors.grey),
                  label: 'Struktur'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time, color: controller.currentIndex.value == 2 ? Colors.green : Colors.grey),
                  label: 'Jadwal'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message, color: controller.currentIndex.value == 3 ? Colors.green : Colors.grey),
                  label: 'Notifikasi'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: controller.currentIndex.value == 5 ? Colors.green : Colors.grey),
                  label: 'Profile'),
            ],
          )),
    );
  }
}

// Ini adalah halaman Dashboard yang ditampilkan
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman profil saat avatar atau nama diklik
                Get.to(ProfileView()); // Arahkan ke halaman profil
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/bg.png'), // Ganti dengan gambar user
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Abraham', // Nama pengguna
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.black54),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Looking For",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "More",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade600,
                    ),
                  ),
                ],
            ),
            SizedBox(height: 20.0),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 60.0,
              mainAxisSpacing: 60.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildMenuItem(context, 'Modul', Icons.book, ModulView()), // Navigasi ke ModulView
                buildMenuItem(context, 'Absen', Icons.checklist, PresensiView()), // Navigasi ke PresensiView
                buildMenuItem(context, 'Schedule', Icons.schedule, JadwalUView()), // Navigasi ke JadwalView
                buildMenuItem(context, 'Leaderboard', Icons.leaderboard, LeaderboardView())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, IconData icon, Widget targetPage) {
  return GestureDetector(
    onTap: () {
      // Navigasi ke halaman target saat menu diklik
      Get.to(targetPage);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFF009D44), // Warna hijau
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20.0),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
  );
}
}

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomepageUView(),
    initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ScheduleView()),
      ],
  ));
}
