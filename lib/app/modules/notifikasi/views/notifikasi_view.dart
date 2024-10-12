import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/notifikasi/controllers/notifikasi_controller.dart';


class NotifikasiView extends StatelessWidget {
  final NotifikasiController controller = Get.put(NotifikasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Notifikasi'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: controller.notifikasiList.length,
          itemBuilder: (context, index) {
            final notifikasi = controller.notifikasiList[index];
            return Card(
              color: Colors.green.shade50,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.image, size: 50, color: Colors.grey),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notifikasi['title']!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          notifikasi['date']!,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 5),
                        Text(notifikasi['description']!),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotifikasiView(),
  ));
}
