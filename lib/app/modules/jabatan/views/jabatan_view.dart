import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jabatan_controller.dart';

class JabatanView extends GetView<JabatanController> {
  final JabatanController controller = Get.put(JabatanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Struktur'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Color(0xFFEDE1D0),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            // Carousel for the main image
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.network(
                    'https://via.placeholder.com/400', // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://via.placeholder.com/400', // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://via.placeholder.com/400', // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.structureList.length,
                  itemBuilder: (context, index) {
                    var item = controller.structureList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['imageUrl'] ?? '',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'] ?? '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item['position'] ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
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
    home: JabatanView(),
  ));
}
