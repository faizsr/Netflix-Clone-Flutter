import 'package:flutter/material.dart';

kWidth(double width) => SizedBox(width: width);
kHeight(double height) => SizedBox(height: height);

const kTextStyleHome = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

final shimmerGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Colors.grey[900]!,
    Colors.grey[900]!,
    Colors.grey[800]!,
    Colors.grey[900]!,
    Colors.grey[900]!
  ],
  stops: const <double>[0.0, 0.35, 0.5, 0.65, 1.0],
);
