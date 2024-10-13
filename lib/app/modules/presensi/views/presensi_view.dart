import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/presensi/controllers/presensi_controller.dart';


class PresensiView extends StatelessWidget {
  final PresensiController controller = Get.put(PresensiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Presensi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: controller.presensiList.length,
                itemBuilder: (context, index) {
                  final presensi = controller.presensiList[index];
                  return Card(
                    color: Colors.green.shade50,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.image, size: 50, color: Colors.grey),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    presensi['name']!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: presensi['status'] == 'Hadir'
                                          ? Colors.green
                                          : Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      presensi['status']!,
                                      style: TextStyle(
                                        color: presensi['status'] == 'Hadir'
                                            ? Colors.white
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  controller.deletePresensi(index);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                                label: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  controller.editPresensi(index);
                                },
                                icon: Icon(Icons.edit, color: Colors.black),
                                label: Text('Edit'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                controller.downloadPDF();
              },
              child: Text('Unduh PDF'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Warna tombol hijau
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: PresensiView(),
  ));
}

