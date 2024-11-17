import 'package:codelab/app/modules/audio/views/audio_view.dart';
import 'package:codelab/app/modules/dokumentasi/views/dokumentasi_view.dart';
import 'package:codelab/app/modules/home/controllers/home_controller.dart';
import 'package:codelab/app/modules/materi/views/materi_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE1D0), // Warna krem terang
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Profil
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/gambar.png'), // Ganti dengan path asset yang sesuai
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Aliya',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Bilah Pencarian
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Judul Seksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Looking For',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Grid Fitur
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    FeatureTile(icon: Icons.menu_book, label: 'Modul', onTap: () => Get.to(ModulPage())),
                    FeatureTile(icon: Icons.checklist, label: 'Absen', onTap: () => Get.to(AbsenPage())),
                    FeatureTile(icon: Icons.schedule, label: 'Jadwal', onTap: () => Get.to(JadwalPage())),
                    FeatureTile(icon: Icons.leaderboard, label: 'Papan Skor', onTap: () => Get.to(PapanSkorPage())),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: homeController.currentIndex.value,
        onTap: (index) {
          homeController.currentIndex.value = index;
          if (index == 0) {
            Get.to(HomeView()); // Beranda
          } else if (index == 1) {
            Get.to(DokumentasiView()); // Halaman grid lainnya
          } else if (index == 2) {
            Get.to(AudioView()); // Halaman jadwal
          } else if (index == 3) {
            Get.to(MateriView()); // Halaman profil
          }
        },
        selectedItemColor: Colors.green, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        selectedLabelStyle: TextStyle(color: Colors.green), // Warna label yang dipilih
        unselectedLabelStyle: TextStyle(color: Colors.grey), // Warna label yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery),
            label: 'Dokumentasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audio_file),
            label: 'Materi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Rekaman',
          ),
        ],
      )),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const FeatureTile({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12), // Menambahkan padding di dalam kotak
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20), // Ukuran ikon lebih kecil
            SizedBox(height: 4), // Jarak antara ikon dan teks
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8, // Ukuran teks lebih kecil
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh halaman tujuan navigasi (tambahkan halaman ini sesuai kebutuhan)
class ModulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modul')),
      body: Center(child: Text('Halaman Modul')),
    );
  }
}

class AbsenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Absen')),
      body: Center(child: Text('Halaman Absen')),
    );
  }
}

class JadwalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal')),
      body: Center(child: Text('Halaman Jadwal')),
    );
  }
}

class PapanSkorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Papan Skor')),
      body: Center(child: Text('Halaman Papan Skor')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Center(child: Text('Halaman Profil')),
    );
  }
}

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid')),
      body: Center(child: Text('Halaman Grid')),
    );
  }
}


void main() async{
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
}
