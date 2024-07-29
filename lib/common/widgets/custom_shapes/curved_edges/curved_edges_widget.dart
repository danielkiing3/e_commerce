import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class UCurvedPathWidget extends StatelessWidget {
  const UCurvedPathWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UCustomCurvedEdges(),
      child: child,
    );
  }
}
