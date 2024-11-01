import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/modul_u_controller.dart';

class ModulUView extends GetView<ModulUController> {
  final List<Map<String, String>> modules = [
    {
      "title": "Modul 1",
      "date": "01-01-2024",
      "description": "Deskripsi Modul 1",
    },
    {
      "title": "Modul 2",
      "date": "02-01-2024",
      "description": "Deskripsi Modul 2",
    },
    {
      "title": "Modul 3",
      "date": "03-01-2024",
      "description": "Deskripsi Modul 3",
    },
    {
      "title": "Modul 4",
      "date": "04-01-2024",
      "description": "Deskripsi Modul 4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MODUL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color(0xFFEDE1D0),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final module = modules[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFFF1F9F6),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.image,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        module["date"]!,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        module["description"]!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(80, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Add navigation to the module details page or any other functionality here
                  },
                  child: Text("Baca"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ModulUView(),
  ));
}
