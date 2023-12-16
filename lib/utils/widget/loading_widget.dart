import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: const AlwaysStoppedAnimation(0), // Dummy animation
          builder: (context, child) {
            return Transform.rotate(
              angle:
                  DateTime.now().millisecondsSinceEpoch / 1000 % 1 * 2 * 3.14,
              child: const Text(
                '/',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            );
          },
        ),
        const Text(
          '.',
          style: TextStyle(
            fontSize: 32.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
