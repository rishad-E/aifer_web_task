import 'package:flutter/material.dart';
import 'package:quiz_task/utils/common/colors.dart';

Widget headingBox(BuildContext context) {
  return Container(
    width: MediaQuery.sizeOf(context).width * .3,
    decoration:
        BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Center(
        child: Text(
      'Quiz Application',
      style: TextStyle(color: kred, fontWeight: FontWeight.bold),
    )),
  );
}

Widget optionBox(
    {Color? bgColor, required Color brColor, required String option}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    width: double.infinity,
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(color: brColor),
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
    child: Text(option),
  );
}

Widget explanationBox({required BuildContext context,Widget? child}) {
  return Container(
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
    child: child,
  );
}
