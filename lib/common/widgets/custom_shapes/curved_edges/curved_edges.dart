import 'package:flutter/material.dart';

/// Custom Clipper for the ClipPath use
class UCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // (0, 0) -- 1 Point
    path.lineTo(0, size.height); // -- 2 points

    final firstPoint = Offset(0, size.height - 20);
    final lastPoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      firstPoint.dx, // - 3 Point -- Control Point
      firstPoint.dy,
      lastPoint.dx, // - 4 Point
      lastPoint.dy,
    );

    final secondFirstPoint = Offset(0, size.height - 20);
    final secondLastPoint = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
      secondFirstPoint.dx, // -- Control Point -- 5 Point
      secondFirstPoint.dy,
      secondLastPoint.dx, // -- 6 Point
      secondLastPoint.dy,
    );

    final thirdFirstPoint = Offset(size.width, size.height - 20);
    final thirdLastPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
      thirdFirstPoint.dx, // -- Control Point -- 7 Point
      thirdFirstPoint.dy,
      thirdLastPoint.dx, // -- 8 Point
      thirdLastPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
