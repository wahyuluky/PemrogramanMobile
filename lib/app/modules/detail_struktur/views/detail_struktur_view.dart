import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_struktur_controller.dart';

class DetailStrukturView extends GetView<DetailStrukturController> {
final DetailStrukturController controller = Get.put(DetailStrukturController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Struktur'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Color(0xFFEDE1D0),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://via.placeholder.com/150', // Replace with actual image URL
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Information container
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama : ${controller.person['name']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text(
                    'Jabatan : ${controller.person['position']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text(
                    'Periode : ${controller.person['period']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Tugas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...List.generate(
                    controller.person['tasks']?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '- ${controller.person['tasks']?[index]}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    home: DetailStrukturView(),
  ));
}
