import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pertanyaan_controller.dart';

class PertanyaanView extends GetView<PertanyaanController> {
   final PertanyaanController controller = Get.put(PertanyaanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.green,
        leading: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${controller.currentQuestion.value + 1}/${controller.totalQuestions} soal',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFEDE1D0), // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Question',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFE8F5E9), // Content background color
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Obx(
                    () => Text(
                      controller.questions[controller.currentQuestion.value],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnswerButton(
                        label: 'A',
                        color: Colors.yellow[100],
                        onPressed: () => controller.selectAnswer('A'),
                      ),
                      AnswerButton(
                        label: 'B',
                        color: Colors.pink[100],
                        onPressed: () => controller.selectAnswer('B'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnswerButton(
                        label: 'C',
                        color: Colors.pink[100],
                        onPressed: () => controller.selectAnswer('C'),
                      ),
                      AnswerButton(
                        label: 'D',
                        color: Colors.yellow[100],
                        onPressed: () => controller.selectAnswer('D'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  controller.submitAnswer();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String label;
  final Color? color;
  final VoidCallback onPressed;

  const AnswerButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(80, 48),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}


void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PertanyaanView(),
    ),
  );
}
