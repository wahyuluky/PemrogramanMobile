import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepage_u_controller.dart';

class HomepageUView extends GetView<HomepageUController> {
  const HomepageUView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 194, 112, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('assets/bg.png'),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'David',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(children: [
                    Icon(Icons.search, color: Colors.black54),
                    SizedBox(width: 10.0),
                    Expanded(child: TextField(decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                    ),
                    ),
                    Icon(Icons.mic, color: Colors.black54),
                  ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(image: AssetImage('assets/bg.png'),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Looking For",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                GridView.count(crossAxisCount: 2,
                crossAxisSpacing: 60.0,
                mainAxisSpacing: 60.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildMenuItem(context, 'Modul', Icons.book),
                  buildMenuItem(context, 'Absen', Icons.checklist),
                  buildMenuItem(context, 'Schedule', Icons.schedule),
                  buildMenuItem(context, 'Leaderboard', Icons.leaderboard),
                ],
                ),
              ],
            ),
            ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF009D44),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20.0),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

void main(){
  runApp(MaterialApp(
    home: HomepageUView(),
  ));
}
