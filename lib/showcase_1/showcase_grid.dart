import 'package:flutter/material.dart';

class ShowcaseGrid extends StatelessWidget {
  const ShowcaseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FittedBox(
        child: Container(
          color: Colors.orange,
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  'images/people.png',
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'images/people.png',
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
