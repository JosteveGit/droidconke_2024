import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final double? size;
  final bool useHero;
  final IconData? ratherIcon;
  final Color? color;
  final Color? backgroundColor;
  final bool shouldBeep;
  const Logo({
    super.key,
    this.size,
    this.useHero = true,
    this.ratherIcon,
    this.backgroundColor,
    this.color,
    this.shouldBeep = true,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Tween<double> tween;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    if (widget.shouldBeep) {
      tween = Tween<double>(begin: 0.8, end: 1)
        ..chain(CurveTween(curve: Curves.bounceIn));
      controller
        ..forward()
        ..repeat(reverse: true);
    } else {
      tween = Tween<double>(begin: 0.7, end: 1);
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: ScaleTransition(
            scale: controller.drive(tween),
            child: Image.asset("images/wr.png"),
          ),
        ),
      ),
    );
  }
}
