import 'package:flutter/material.dart';
import 'package:quiz_task/model/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  int currentIndex = 0;
  Map<int, String> userAnswers = {}; // Stores selected answers

  void selectAnswer(int index, String answer) {
    if (userAnswers.containsKey(index)) return; // Prevent changing answers
    userAnswers[index] = answer;
    notifyListeners();
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
    }
  }
}
