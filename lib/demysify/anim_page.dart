import 'package:droidconke_showcase/colors.dart';
import 'package:droidconke_showcase/demysify/functions.dart';
import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  const AnimPage({super.key});

  @override
  State<AnimPage> createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage> with TickerProviderStateMixin {
  final GlobalKey startKey = GlobalKey();
  final GlobalKey endKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animatePosition(
            context,
            this,
            startKey: startKey,
            endKey: endKey,
            builder: (_) {
              return Container(
                width: 400,
                height: 400,
                color: blue,
              );
            },
          );
        },
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              key: startKey,
              width: 400,
              height: 400,
              color: gold,
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 400,
                key: endKey,
                height: 400,
                color: blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
