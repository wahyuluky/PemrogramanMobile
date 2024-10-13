import 'package:flutter/material.dart';
import 'package:mobile/app/modules/biodata/views/biodata_view.dart';
import 'package:mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mobile/app/modules/leaderboard/views/leaderboard_view.dart'; // Gunakan untuk grafik chart

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan gambar profil
              radius: 20.0,
            ),
            SizedBox(width: 10),
            Text('Abraham'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Menu action
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFEDE1D0), // Warna latar belakang mirip yang di gambar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card untuk Users
            GestureDetector(
              onTap: () {
                Get.to(BiodataView());
              },
              child: Obx(() => buildStatisticCard(
                title: 'Users',
                count: '${controller.userCount.value}k',
                icon: Icons.people,
              )),
            ),

            SizedBox(height: 20),

            // Chart untuk Statistic Event
            Text(
              'Statistic Event',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
              child: buildChart(), // Grafik event
            ),
            SizedBox(height: 20),

            // Card untuk Leaderboard
           GestureDetector(
            onTap: () {
              Get.to(LeaderboardView());
            },
            child: Obx(() => buildStatisticCard(
              title: 'Leaderboard',
              count: '${controller.leaderboardCount.value}k',
              icon: Icons.leaderboard,
            )),
          ),

            
          ],
        ),
      ),
    );
  }

  // Widget untuk Card Statistik
  Widget buildStatisticCard({required String title, required String count, required IconData icon}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  count,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(icon, size: 40, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  // Widget untuk Grafik Event (menggunakan charts_flutter)
    // Widget untuk Grafik Event (menggunakan charts_flutter)
  Widget buildChart() {
    List<charts.Series<EventData, String>> seriesList = [
      charts.Series<EventData, String>(
        id: 'Events',
        domainFn: (EventData event, _) => event.day,
        measureFn: (EventData event, _) => event.count,
        colorFn: (_, __) => charts.MaterialPalette.black,
        data: [
          EventData('Mon', 10),
          EventData('Tue', 15),
          EventData('Wed', 40),
          EventData('Thu', 35),
        ],
      )
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }

}

// Data model untuk grafik
class EventData {
  final String day;
  final int count;

  EventData(this.day, this.count);
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardView(),
  ));
}

