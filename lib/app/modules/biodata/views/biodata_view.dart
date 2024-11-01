import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/modules/biodata/controllers/biodata_controller.dart';

class Biodata {
  final String title;
  final String imagePath;

  Biodata(this.title, this.imagePath);
}

class BiodataView extends StatelessWidget {
  final BiodataController controller = Get.put(BiodataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/bg.jpg'), // Replace with profile image path
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
              // Logic for menu action
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: controller.biodataList.length,
          itemBuilder: (context, index) {
            final biodata = controller.biodataList[index];
            return Card(
              color: Colors.green.shade50,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Image.asset(
                  'assets/bg.png', // Placeholder for image
                  width: 50,
                  height: 50,
                ),
                title: Text(biodata.title),
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
    home: BiodataView(),
  ));
}

