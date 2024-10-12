import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mobile/app/modules/jadwal/controllers/jadwal_controller.dart';

class JadwalView extends StatelessWidget {
  final JadwalController controller = Get.put(JadwalController());

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController(); 

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              calendarFormat: controller.calenderFormat.value,
              onFormatChanged: (CalendarFormat _format) {
                controller.updateCalendarFormat(_format);
              },
              selectedDayPredicate: (day) {
                return isSameDay(day, DateTime.now());
              },
              onDaySelected: (selectedDay, focusedDay) {
                // Logika ketika tanggal dipilih
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.red.shade300,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.red.shade100,
                  shape: BoxShape.circle,
                ),
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showAddEditDialog(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: controller.kegiatanList.length,
                itemBuilder: (context, index) {
                  final kegiatan = controller.kegiatanList[index];
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
                                kegiatan['title']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(kegiatan['date']!,
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(height: 5),
                              Text(kegiatan['description']!),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  controller.deleteKegiatan(index);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                                label: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  // Buka dialog untuk mengedit kegiatan
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
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan dialog tambah/edit kegiatan
  void showAddEditDialog(BuildContext context, {int? index}) {
    final isEditing = index != null;

    if (isEditing) {
      final kegiatan = controller.kegiatanList[index];
      titleController.text = kegiatan['title']!;
      descriptionController.text = kegiatan['description']!;
      dateController.text = kegiatan['date']!;
    } else {
      titleController.clear();
      descriptionController.clear();
      dateController.clear();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Kegiatan' : 'Tambah Kegiatan'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person),
                ),
                TextButton(
                  onPressed: () {
                    // Logika untuk ambil foto
                  },
                  child: Text('Take Photo'),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Judul Kegiatan'),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Tanggal Kegiatan'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Deskripsi Kegiatan'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Tutup dialog tanpa menyimpan
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  controller.editKegiatan(
                    index,
                    titleController.text,
                    dateController.text,
                    descriptionController.text,
                  );
                } else {
                  controller.addKegiatan(
                    titleController.text,
                    dateController.text,
                    descriptionController.text,
                  );
                }
                Get.back(); // Tutup dialog setelah menyimpan
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
    home: JadwalView(),
  ));
}
