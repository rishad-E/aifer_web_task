import 'package:flutter/material.dart';
import 'package:quiz_task/utils/common/box.dart';
import 'package:quiz_task/utils/common/colors.dart';

Widget customBox({double? height, double? width}) =>
    SizedBox(height: height, width: width);

Widget questionBox({required String quesIndex, required String question}) {
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(horizontal: 10),
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
        Text(
          quesIndex == 'Explanation' ? quesIndex : 'Question $quesIndex',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        hMBox,
        Text(
          question,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

Widget quizBox({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
    child: child,
  );
}

ElevatedButton quizButton(
    {required String dir, required void Function()? onPressed}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(kwhite),
        visualDensity: VisualDensity.compact),
    onPressed: onPressed,
    child: Text(
      dir,
      style: TextStyle(color: kblack),
    ),
  );
}
