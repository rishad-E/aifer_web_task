import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_task/controller/quiz_provider.dart';
import 'package:quiz_task/model/quiz_model.dart';
import 'package:quiz_task/utils/common/box.dart';
import 'package:quiz_task/utils/common/colors.dart';
import 'package:quiz_task/widgets/quiz_widgets.dart';
import 'package:quiz_task/widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headingBox(context),
            customBox(height: 25),
            Consumer<QuizProvider>(builder: (context, quiz, child) {
              return Container(
                width: MediaQuery.sizeOf(context).width * 0.7,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Quiz',
                      style: TextStyle(fontSize: 18),
                    ),
                    customBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            child: PageView.builder(
                              itemCount: questions.length,
                              controller: quiz.pageController,
                              onPageChanged: (index) {
                                quiz.currentIndex = index;
                              },
                              itemBuilder: (context, index) {
                                String crctAnswr = questions[index]['correct'];
                                String? slctAnswr = quiz.userAnswers[index];
                                return Column(
                                  children: [
                                    questionBox(
                                        quesIndex: '${index + 1}',
                                        question: questions[index]['question']),
                                    hMBox,
                                    ...questions[index]['options'].map<Widget>(
                                      (option) {
                                        bool isCorrect = option == crctAnswr;
                                        bool isSelected = option == slctAnswr;
                                        bool realAnser =
                                            isCorrect && slctAnswr != null;
                                        return GestureDetector(
                                          onTap: quiz.userAnswers
                                                  .containsKey(index)
                                              ? null
                                              : () {
                                                  quiz.selectAnswer(
                                                      index, option);
                                                },
                                          child: optionBox(
                                            bgColor: isSelected
                                                ? (isCorrect ? kgreen : kred)
                                                : (realAnser ? kgreen : kwhite),
                                            brColor: isSelected
                                                ? (isCorrect ? kgreen : kred)
                                                : (realAnser ? kgreen : kwhite),
                                            option: option,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    hMBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        quizButton(
                                          dir: 'Prev',
                                          onPressed: quiz.previousQuestion,
                                        ),
                                        wMBox,
                                        quizButton(
                                          dir: 'Next',
                                          onPressed: quiz.nextQuestion,
                                        )
                                      ],
                                    ),
                                    hMBox,
                                    if (quiz.showExplanation &&
                                        quiz.userAnswers.containsKey(index))
                                      questionBox(
                                          quesIndex: 'Explanation',
                                          question: questions[index]
                                              ['explanation']),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        wBox,
                        Expanded(
                          flex: 1,
                          child: explanationBox(
                            context: context,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Question ${quiz.currentIndex + 1}/10'),
                                    const Text('Need Help ?'),
                                  ],
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  itemCount: questions.length,
                                  itemBuilder: (context, index) {
                                    bool isAnswered =
                                        quiz.userAnswers.containsKey(index);
                                    bool isCorrect = questions[index]
                                            ['correct'] ==
                                        quiz.userAnswers[index];
                                    return GestureDetector(
                                      onTap: () {
                                        quiz.changePage(index);
                                        log(quiz.currentIndex.toString());
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: isAnswered
                                            ? (isCorrect ? kgreen : kred)
                                            : Colors.grey,
                                        child: Text('${index + 1}',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
