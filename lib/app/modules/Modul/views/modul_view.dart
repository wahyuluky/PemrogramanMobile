import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/Modul/controllers/modul_controller.dart';




class Modul {
  String title;
  String penulis;
  String deskripsi;
  String isiModul;

  Modul(this.title, this.penulis, this.deskripsi, this.isiModul);
}

class ModulView extends StatelessWidget {
  final ModulController controller = Get.put(ModulController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
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
              // Logika menu
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: controller.modulList.length,
          itemBuilder: (context, index) {
            final modul = controller.modulList[index];
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
                            Text(modul.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(modul.penulis, style: TextStyle(fontSize: 12)),
                            SizedBox(height: 5),
                            Text(modul.deskripsi),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            controller.deleteModul(index);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                          label: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Buka dialog untuk mengedit
                            showAddEditDialog(context, index: index);
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
          // Buka dialog untuk menambah modul
          showAddEditDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showAddEditDialog(BuildContext context, {int? index}) {
    final isEditing = index != null;

    // Jika sedang mengedit, isi field dengan data modul yang ada
    if (isEditing) {
      final modul = controller.modulList[index];
      controller.titleController.text = modul.title;
      controller.penulisController.text = modul.penulis;
      controller.deskripsiController.text = modul.deskripsi;
      controller.isiModulController.text = modul.isiModul;
    } else {
      // Kosongkan field jika menambah modul baru
      controller.titleController.clear();
      controller.penulisController.clear();
      controller.deskripsiController.clear();
      controller.isiModulController.clear();
    }

    // Menampilkan dialog
    Get.defaultDialog(
      title: isEditing ? 'Edit Modul' : 'Tambah Modul',
      titleStyle: TextStyle(fontSize: 20),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              child: IconButton(
                icon: Icon(Icons.camera_alt, size: 30),
                onPressed: () {
                  // Logika untuk mengambil foto
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Logika untuk mengambil foto
              },
              child: Text('Take Photo'),
            ),
            SizedBox(height: 10),
            buildTextField('Judul', controller.titleController),
            buildTextField('Penulis', controller.penulisController),
            buildTextField('Deskripsi', controller.deskripsiController),
            buildTextField('Isi Modul', controller.isiModulController),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  // Update modul yang ada
                  controller.updateModul(
                    index,
                    controller.titleController.text,
                    controller.penulisController.text,
                    controller.deskripsiController.text,
                    controller.isiModulController.text,
                  );
                } else {
                  // Tambah modul baru
                  controller.addModul(
                    controller.titleController.text,
                    controller.penulisController.text,
                    controller.deskripsiController.text,
                    controller.isiModulController.text,
                  );
                }
                Get.back(); // Tutup dialog setelah menyimpan
              },
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      radius: 10.0,
      barrierDismissible: false,
      actions: [
        IconButton(
          onPressed: () {
            Get.back(); // Tutup dialog tanpa menyimpan
          },
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  // Widget helper untuk membuat TextField
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ModulView(),
  ));
}

