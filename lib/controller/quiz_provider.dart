import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_task/model/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  int currentIndex = 0;
  Map<int, String> userAnswers = {}; // Stores selected answers
  PageController pageController = PageController();
  bool showExplanation = false;

  QuizProvider() {
    _loadQuizProgress();
  }

  void selectAnswer(int index, String answer) async {
    if (userAnswers.containsKey(index)) return;

    userAnswers[index] = answer;
    showExplanation = true;
    notifyListeners();
    await _saveQuizProgress();
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      currentIndex++;
      showExplanation = false;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);

      showExplanation = false;
      notifyListeners();
    }
  }
  void changePage(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    _saveQuizProgress();
    notifyListeners();
  }

  Future<void> _saveQuizProgress() async {
    final box = await Hive.openBox('quizBox');
    box.put('userAnswers', userAnswers);
  }

  Future<void> _loadQuizProgress() async {
    final box = await Hive.openBox('quizBox');
    userAnswers =
        Map<int, String>.from(box.get('userAnswers', defaultValue: {}));
    notifyListeners();
  }
}
