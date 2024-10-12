import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';

class JadwalController extends GetxController {
  //TODO: Implement JadwalController

  final count = 0.obs;
  // State variables
   // List of activities (title, date, description)
  var calenderFormat = CalendarFormat.month.obs; // Calendar format state
  
  // Method to add a new activity
  void addKegiatan(String title, String date, String description) {
    kegiatanList.add({
      'title': title,
      'date': date,
      'description': description,
    });
  }

  // Method to edit an existing activity
  void editKegiatan(int index, String title, String date, String description) {
    kegiatanList[index] = {
      'title': title,
      'date': date,
      'description': description,
    };
  }

  // Method to delete an activity
  void deleteKegiatan(int index) {
    kegiatanList.removeAt(index);
  }

  // Method to update calendar format (month, two weeks, week)
  void updateCalendarFormat(CalendarFormat format) {
    calenderFormat.value = format;
  }

  var kegiatanList = [
    {'title': 'Kegiatan 1', 'description': 'Deskripsi Kegiatan', 'date': 'date', 'location': 'lokasi 1'},
    {'title': 'Kegiatan 2', 'description': 'Deskripsi Kegiatan', 'date': 'date', 'location': 'lokasi 2'},
  ].obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
