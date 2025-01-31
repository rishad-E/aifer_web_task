import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_task/controller/quiz_provider.dart';
import 'package:quiz_task/utils/common/box.dart';
import 'package:quiz_task/utils/common/colors.dart';
import 'package:quiz_task/view/quiz_page.dart';
import 'package:quiz_task/widgets/widgets.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context,listen: false);
    int score = provider.getCorrectAnswersCount();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              // width: double.infinity,
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(0, 6),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Quiz Master - Test Your Knowledge!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  hMBox,
                  const Text(
                    "🎉 Congratulations! 🎉",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  hMBox,
                   Text(
                    "You scored $score out of 10!",
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  customBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage()),
                        (route) => false, 
                      );
                    },
                    child: const Text("Play Again"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
