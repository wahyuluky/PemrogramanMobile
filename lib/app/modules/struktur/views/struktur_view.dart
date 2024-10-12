import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/struktur/controllers/struktur_controller.dart';

class Struktur {
  final String Nama;
  final String Periode;
  final String Jabatan;

  Struktur(this.Nama, this.Periode, this.Jabatan);
}

class StrukturView extends StatelessWidget {
  final StrukturController controller = Get.put(StrukturController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Struktur'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: controller.strukturList.length,
          itemBuilder: (context, index) {
            final modul = controller.strukturList[index];
            return Card(
              color: Colors.green.shade50,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.image, size: 50, color: Colors.grey),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(modul.Nama,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(modul.Periode, style: TextStyle(fontSize: 12)),
                            SizedBox(height: 5),
                            Text(modul.Jabatan),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            controller.deleteStruktur(index);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                          label: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            showEditDialog(context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol FAB ditekan
          showAddDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showEditDialog(BuildContext context) {
    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      // Implement photo selection logic
                    },
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Periode'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Jabatan'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog without saving
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog after saving
              },
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }

   void showAddDialog(BuildContext context) {
    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      // Implement photo selection logic
                    },
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Periode'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Jabatan'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog without saving
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog after saving
              },
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: StrukturView(),
  ));
}


