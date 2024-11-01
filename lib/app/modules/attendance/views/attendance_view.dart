import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  final AttendanceController controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.attendanceList.length,
            itemBuilder: (context, index) {
              var item = controller.attendanceList[index];
              return Card(
                color: Colors.lightGreen[50],
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    'https://via.placeholder.com/50', // Placeholder image URL
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item['title'] ?? ''),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: item['status'] == 'Hadir' ? Colors.green : Colors.red[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item['status'] ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: AttendanceView(),
  ));
}
