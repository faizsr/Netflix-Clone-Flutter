import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.size,
    required this.index,
    required this.image,
  });

  final Size size;
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Row(
          children: [
            SizedBox(
              width: size.width * 0.1,
            ),
            Container(
              width: size.width * 0.35,
              height: size.height * 0.23,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(image).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: StrokeText(
            text: '${index + 1}',
            textStyle: const TextStyle(
              fontSize: 100,
              height: 0.9,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            strokeColor: Colors.white,
            strokeWidth: 3,
          ),
        ),
      ],
    );
  }
}
