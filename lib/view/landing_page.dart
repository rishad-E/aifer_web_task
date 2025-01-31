import 'package:flutter/material.dart';
import 'package:quiz_task/utils/common/box.dart';
import 'package:quiz_task/utils/common/colors.dart';
import 'package:quiz_task/view/quiz_page.dart';
import 'package:quiz_task/widgets/landing_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Quiz Master - Test Your Knowledge!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    hMBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(text: "Welcome to"),
                            WidgetSpan(child: wBox),
                            const TextSpan(
                              text: "Quiz Master,",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const TextSpan(
                                text:
                                    " an interactive quiz application designed to challenge and enhance your knowledge across various topics. Whether you're a student, professional, or just someone who loves quizzes, this app provides an engaging experience with instant feedback and progress tracking."),
                          ],
                        ),
                      ),
                    ),
                    hMBox,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 5),
                      width: double.infinity,
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Features:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          FeatureText(
                            feature: 'Seamless Navigation :',
                            descri:
                                '– Move between questions easily using the question number selector or Next/Previous buttons.',
                          ),
                          FeatureText(
                            feature: 'Answer Lock-in :',
                            descri:
                                '– Once you select an answer, it cannot be changed, making the challenge more exciting!',
                          ),
                          FeatureText(
                            feature: 'Instant Feedback :',
                            descri:
                                '– Correct answers are highlighted in green, while incorrect ones appear in red.',
                          ),
                          FeatureText(
                            feature: 'Explanations for Learning :',
                            descri:
                                '– Get detailed explanations after answering to improve your understanding.',
                          ),
                          FeatureText(
                            feature: 'Progress Tracking :',
                            descri:
                                '– Your quiz progress is saved locally, allowing you to continue where you left off.',
                          ),
                        ],
                      ),
                    ),
                    hBox,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 5),
                      width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How It Works: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          hBox,
                          const Text(
                            "1. Select a question from the question navigator or use the Next/Previous buttons. ",
                            style: TextStyle(fontSize: 13),
                          ),
                          const LandingRichText(
                            text1:
                                " Click on an answer choice – once selected, it",
                            text2: " cannot be changed.",
                            index: "2. ",
                            first: false,
                          ),
                          const LandingRichText(
                            text1: " instant feedback",
                            text2:
                                " with color indications and a detailed explanation.",
                            first: true,
                            index: "3. ",
                          ),
                          const Text(
                            "4. Track your answered questions and revisit any time.",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    hMBox,
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue.shade300)),
                          onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QuizPage()),
                                (route) => false,
                              ),
                          child: Text(
                            "🚀 Start your quiz now and test your knowledge!",
                            style: TextStyle(color: kblack),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
