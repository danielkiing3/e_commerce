import 'package:flutter/material.dart';

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
      firstPoint.dy, // - 3 Point -- Control Point
      lastPoint.dx, // - 4 Point
      lastPoint.dy, // - 4 Point
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

    // Path path = Path();
    // path.lineTo(0, size.height * 1.0028571);
    // path.quadraticBezierTo(size.width * 0.0859750, size.height * 0.8765429,
    //     size.width * 0.1376500, size.height * 0.8914000);
    // path.cubicTo(
    //     size.width * 0.2076500,
    //     size.height * 0.8642571,
    //     size.width * 0.2751750,
    //     size.height * 0.7864571,
    //     size.width * 0.3504250,
    //     size.height * 0.7959429);
    // path.cubicTo(
    //     size.width * 0.4316750,
    //     size.height * 0.7967714,
    //     size.width * 0.5023000,
    //     size.height * 0.8660000,
    //     size.width * 0.5450000,
    //     size.height * 0.9085714);
    // path.cubicTo(
    //     size.width * 0.6143250,
    //     size.height * 0.9739429,
    //     size.width * 0.6808000,
    //     size.height * 0.9962000,
    //     size.width * 0.7600000,
    //     size.height * 0.9971429);
    // path.quadraticBezierTo(size.width * 0.8206250, size.height * 0.9985714,
    //     size.width * 1.0025000, size.height * 1.0028571);
    // path.lineTo(size.width, 0);
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
