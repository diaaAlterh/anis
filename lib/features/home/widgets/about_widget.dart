import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutWidget extends StatelessWidget {
  final String svgImage;
  final String title;
  final String description;
  final Function()? onTitlePressed;
  final Function()? onDescriptionPressed;

  const AboutWidget(
      {super.key,
      required this.svgImage,
      required this.description,
      required this.title,
      this.onTitlePressed,
      this.onDescriptionPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        children: [
          SizedBox(height: 40, child: SvgPicture.asset(svgImage)),
          const SizedBox(height: 8,),
          TextButton(
            onPressed: onTitlePressed,
            child: SelectableText(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: onDescriptionPressed,
            child: SelectableText(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
