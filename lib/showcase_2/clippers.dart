import 'package:flutter/material.dart';

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const factor = 25.0;
    path.moveTo(factor, size.height);
    path.lineTo(size.width - factor, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LeftBannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const factor = 20.0;
    path.moveTo(factor, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RightBannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const factor = 20.0;
    path.moveTo(0, size.height);
    path.lineTo(size.width - factor, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
