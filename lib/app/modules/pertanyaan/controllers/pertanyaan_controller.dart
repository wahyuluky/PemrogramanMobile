import 'package:get/get.dart';

class PertanyaanController extends GetxController {
  //TODO: Implement PertanyaanController

  var currentQuestion = 0.obs;
  final totalQuestions = 5;

  // List of questions for the quiz
  List<String> questions = [
    "Apa yang dimaksud dengan Hizbul Wathan?",
    "Siapa pendiri Hizbul Wathan?",
    "Apa tujuan utama Hizbul Wathan?",
    "Sebutkan salah satu kegiatan Hizbul Wathan?",
    "Apa peran Hizbul Wathan dalam pendidikan?",
  ];

  // Variable to store selected answer
  var selectedAnswer = ''.obs;

  void selectAnswer(String answer) {
    selectedAnswer.value = answer;
  }

  void submitAnswer() {
    if (selectedAnswer.value.isNotEmpty) {
      // Move to the next question or show a result if on the last question
      if (currentQuestion.value < totalQuestions - 1) {
        currentQuestion.value++;
        selectedAnswer.value = ''; // Reset selected answer for next question
      } else {
        Get.snackbar("Quiz", "Quiz selesai!");
        // You can navigate to a result page or reset the quiz
      }
    } else {
      Get.snackbar("Error", "Pilih jawaban terlebih dahulu.");
    }
  }
}
