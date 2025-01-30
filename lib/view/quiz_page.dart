import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_task/controller/quiz_provider.dart';
import 'package:quiz_task/model/quiz_model.dart';
import 'package:quiz_task/utils/common/box.dart';
import 'package:quiz_task/utils/common/colors.dart';
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
            Container(
              width: MediaQuery.of(context).size.width * .3,
              decoration: BoxDecoration(
                  color: kwhite, borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                  child: Text(
                'Quiz Application UI',
                style: TextStyle(color: kred, fontWeight: FontWeight.bold),
              )),
            ),
            customBox(height: 25),
            Consumer<QuizProvider>(builder: (context, quiz, child) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.7,
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
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            child: PageView.builder(
                              itemCount: questions.length,
                              onPageChanged: (index) {
                                quiz.currentIndex = index;
                              },
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    questionBox(
                                        quesIndex: '${index + 1}',
                                        question: questions[index]['question']),
                                    hMBox,
                                    ...questions[index]['options']
                                        .map<Widget>((option) {
                                      bool isCorrect =
                                          option == questions[index]['correct'];
                                      bool isSelected =
                                          quiz.userAnswers[index] == option;

                                      return GestureDetector(
                                        onTap: () {
                                          log(option);
                                          // quiz.selectAnswer(index, option);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 12),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: kwhite,
                                            border: Border.all(
                                                color: isSelected
                                                    ?(isCorrect ? Colors.green : Colors.red)
                                                    : Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                offset: const Offset(0, 2),
                                                blurRadius: 4,
                                              ),
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                                offset: const Offset(0, 6),
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Text(option),
                                        ),
                                      );
                                    }).toList(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        quizButton(
                                          dir: 'Prev',
                                          onPressed: () {
                                            
                                          },
                                        ),
                                        wMBox,
                                        quizButton(
                                          dir: 'Next',
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                    hMBox,
                                    questionBox(
                                        quesIndex: '1',
                                        question:
                                            'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem '),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        wBox,
                        Expanded(
                          flex: 1,
                          child: Container(
                            // decoration: const BoxDecoration(color: Colors.red),
                            height: MediaQuery.sizeOf(context).height * 0.65,
                            padding: const EdgeInsets.all(15),
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
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Question 1/8'),
                                    Text('Need Help ?'),
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
                                  itemCount: 20,
                                  itemBuilder: (context, index) => CircleAvatar(
                                    child: Text(
                                      ' ${index + 1}',
                                      style: TextStyle(
                                          fontSize: 12, color: kwhite),
                                    ),
                                  ),
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
