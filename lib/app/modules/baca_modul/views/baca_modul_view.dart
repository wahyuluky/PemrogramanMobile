import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/baca_modul_controller.dart';

class BacaModulView extends GetView<BacaModulController> {
  final BacaModulController controller = Get.put(BacaModulController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modul'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement navigation back action if needed
          },
        ),
      ),
      body: Container(
        color: Color(0xFFEDE1D0), // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Color(0xFFE8F5E9), // Content background color
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          controller.hizbulWathanContent[controller.currentPage.value - 1],
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: controller.previousPage,
                  icon: Icon(Icons.arrow_left),
                ),
                Obx(
                  () => Text(
                    'Page ${controller.currentPage.value}/${controller.totalPages}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  onPressed: controller.nextPage,
                  icon: Icon(Icons.arrow_right),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[100],
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  // Implement the quiz start action
                },
                child: Text(
                  'Mulai Quiz',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BacaModulView(),
    ),
  );
}
