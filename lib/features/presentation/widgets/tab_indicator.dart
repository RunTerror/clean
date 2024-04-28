import 'dart:math';

import 'package:flutter/material.dart';
import 'package:map/service_locator.dart';

class TabIndicationPainter extends CustomPainter {
  late Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  late PageController pageController;

  TabIndicationPainter(
      {this.dxTarget = 125.0,
      this.dxEntry = 25.0,
      this.radius = 21.0,
      this.dy = 25.0,
      required this.pageController})
      : super(repaint: pageController) {
    painter = Paint()
      ..color = customTheme.myTheme.primaryColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController.position;

    double fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;
    bool left2right = dxEntry < dxTarget;
    Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = Path();
    path.addArc(
        Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, customTheme.myTheme.primaryColor, 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainter oldDelegate) => true;
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = customTheme.myTheme.primaryColor;
    paint.style = PaintingStyle.fill;
    var path = Path();

    path.moveTo(0, size.height * 0.05);
    path.lineTo(size.width * 0.11, size.height * 0.22);
    path.quadraticBezierTo(size.width * 0.13, size.height * 0.25,
        size.width * 0.18, size.height * 0.24);
    path.quadraticBezierTo(size.width * 0.13, size.height * 0.25,
        size.width * 0.18, size.height * 0.24);
    path.lineTo(size.width * 0.95, size.height * 0.07);
    path.quadraticBezierTo(
        size.width, size.height * 0.05, size.width * 0.98, size.height * 0.02);
    path.lineTo(size.width * 0.96, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
