import 'package:flutter/material.dart';
import 'package:quiz_task/utils/common/box.dart';
import 'package:quiz_task/utils/common/colors.dart';

class FeatureText extends StatelessWidget {
  final String feature;
  final String descri;
  const FeatureText({super.key, required this.feature, required this.descri});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle, color: kgreen),
            wBox,
            Text(
              feature,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        hBox,
        Text(
          descri,
          style: const TextStyle(fontSize: 13),
        )
      ],
    );
  }
}

class LandingRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final String index;
  final bool first;
  const LandingRichText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.first, required this.index});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: first
          ? TextSpan(
              children: [
                TextSpan(text: index, style: const TextStyle(fontSize: 13)),
                TextSpan(
                  text: text1,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                WidgetSpan(child: wBox),
                TextSpan(text: text2, style: const TextStyle(fontSize: 13)),
              ],
            )
          : TextSpan(
              children: [
                TextSpan(text: index, style: const TextStyle(fontSize: 13)),
                TextSpan(text: text1, style: const TextStyle(fontSize: 13)),
                WidgetSpan(child: wBox),
                TextSpan(
                  text: text2,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
    );
  }
}
