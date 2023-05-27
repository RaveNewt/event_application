import 'package:event_application/shared/theme.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback? onPressed;
  const Setting(
      {this.title = '',
      this.icon = const Icon(
        Icons.history,
      ),
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 24),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
