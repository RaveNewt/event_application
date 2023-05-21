import 'package:event_application/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TextDescription extends StatelessWidget {
  final String text;
  const TextDescription({this.text = '', super.key});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Length,
      trimCollapsedText: 'Read more',
      trimExpandedText: ' Read less',
      moreStyle:
          primaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      lessStyle: primaryTextStyle.copyWith(fontSize: 14, fontWeight: bold),
    );
  }
}
