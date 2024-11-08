import 'package:flutter/material.dart';

Offset? getPositionForKey(GlobalKey key) {
  if (key.currentContext == null) {
    return null;
  }
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  final startPosition = renderBox.localToGlobal(Offset.zero);
  return startPosition;
}

double getAnimValue({
  required double start,
  required double end,
  required Animation<double> animation,
}) {
  return start + (end - start) * animation.value;
}

void animatePosition(
  BuildContext context,
  TickerProviderStateMixin mixin, {
  required GlobalKey startKey,
  required GlobalKey endKey,
  required Widget Function(Animation<double> animation) builder,
}) async {
  // Initialize AnimationController
  late AnimationController animController = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: mixin,
  );
  final curve = CurvedAnimation(
    parent: animController,
    curve: Curves.easeInOut,
  );


  // Get start and end positions
  final startPosition = getPositionForKey(startKey);
  final endPosition = getPositionForKey(endKey);
  if (startPosition == null || endPosition == null) {
    return;
  }


  // Create and insert overlay entry to animate
  final entry = OverlayEntry(
    builder: (context) {
      return AnimatedBuilder(
        animation: curve,
        builder: (_, child) {
          return Positioned(
            top: getAnimValue(
              start: startPosition.dy,
              end: endPosition.dy,
              animation: curve,
            ),
            left: getAnimValue(
              start: startPosition.dx,
              end: endPosition.dx,
              animation: curve,
            ),
            child: builder(curve),
          );
        },
      );
    },
  );
  Overlay.of(context).insert(entry);

  // Start animation
  await animController.forward(from: 0);


  // Remove overlay entry and dispose controller
  entry.remove();
  animController.dispose();

}
