import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_quote/ui/styleguide/theme_text.dart';

class QuoteWidget extends StatelessWidget {
  final Color backgroundColor;
  final String quote, author;

  const QuoteWidget({
    super.key,
    required this.backgroundColor,
    required this.quote,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 48.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/q.png',
            color: Colors.white.withOpacity(0.4),
            width: 70.w,
            height: 70.h,
          ),
          Expanded(
            child: Center(
              child: Text(
                quote,
                style: ThemeText.headline,
              ),
            ),
          ),
          Center(
            child: Text(
              author,
              style: ThemeText.subhead,
            ),
          ),
        ],
      ),
    );
  }
}
