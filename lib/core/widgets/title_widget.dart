import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/images/line_right.svg'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFFC99012), fontWeight: FontWeight.w600),
          ),
        ),
        SvgPicture.asset('assets/images/line_left.svg'),
      ],
    );
  }
}
