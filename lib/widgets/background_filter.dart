import 'package:flutter/material.dart';

class BackgroundFilter extends StatelessWidget {
  const BackgroundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 228, 14, 156).withOpacity(0.8),
            const Color.fromARGB(255, 230, 129, 213).withOpacity(0.8)
          ],
        ).createShader(rect);
      },
      blendMode: BlendMode.srcOver,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pinkAccent,
              const Color.fromARGB(255, 228, 14, 156).withOpacity(0.8),
              const Color.fromARGB(255, 216, 83, 194).withOpacity(0.8),
            ],
            stops: const [0.0, 0.4, 0.6],
          ),
        ),
      ),
    );
  }
}
