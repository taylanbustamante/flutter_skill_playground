import 'dart:math' as math;

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double porcentagem;

  CirclePainter({required this.porcentagem});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = math.min(size.width, size.height) / 2 - 12;

    Paint background = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    Paint foreground = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    canvas.drawCircle(center, radius, background);

    final rect = Rect.fromCircle(center: center, radius: radius);
    final start = -math.pi / 2;
    final sweep = 2 * math.pi * porcentagem;
    canvas.drawArc(rect, start, sweep, false, foreground);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(porcentagem * 100).toStringAsFixed(0)}%',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return oldDelegate.porcentagem != porcentagem;
  }
}
