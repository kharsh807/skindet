import 'dart:ui';
import 'package:flutter/material.dart';

final _borderRadius=BorderRadius.circular(18);

class GlassBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;

  const GlassBox({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: SizedBox(
        width: 300,
        height: 400,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1,
                sigmaY: 1,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5),
                  ]
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
              child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
