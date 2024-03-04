import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText(
      this.title, {
        super.key,
        this.style,
        this.additionalKeySophistication,
      });

  final String title;
  final TextStyle? style;
  final String? additionalKeySophistication;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      key: ValueKey<String>(title + (additionalKeySophistication ?? '')),
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(title, textStyle: style),
      ],
    );
  }
}
