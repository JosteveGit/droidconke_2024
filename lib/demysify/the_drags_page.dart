import 'package:droidconke_showcase/colors.dart';
import 'package:flutter/material.dart';

class TheDragsPage extends StatefulWidget {
  const TheDragsPage({super.key});

  @override
  State<TheDragsPage> createState() => _TheDragsPageState();
}

class _TheDragsPageState extends State<TheDragsPage> {
  final item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool hasEntered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DragTarget(
            onWillAcceptWithDetails: (details) {
              setState(() {
                hasEntered = true;
              });
              return true;
            },
            onAcceptWithDetails: (details) {
              setState(() {
                hasEntered = false;
              });
            },
            onLeave: (data) {
              setState(() {
                hasEntered = false;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 150,
                height: 250,
                color: hasEntered ? gold : blue,
              );
            },
          ),
          Container(
            width: double.maxFinite,
            height: 200,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: ReorderableListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: item.length,
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final int item = this.item.removeAt(oldIndex);
                  this.item.insert(newIndex, item);
                });
              },
              proxyDecorator: (child, index, animation) {
                // rotate the item while dragging
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return Transform.rotate(
                      angle: animation.value,
                      child: child,
                    );
                  },
                );
              },
              itemBuilder: (context, index) {
                return Draggable<int>(
                  data: index,
                  key: ValueKey(index),
                  feedback: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 100,
                      height: 200,
                      color: blue,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text(
                          item[index].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    width: 100,
                    height: 200,
                    color: blue,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        item[index].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
