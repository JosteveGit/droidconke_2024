import 'package:flutter/material.dart';

class ShowcaseImage extends StatelessWidget {
  const ShowcaseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Image.asset(
        'images/people.png',
      ),
    );
  }
}
