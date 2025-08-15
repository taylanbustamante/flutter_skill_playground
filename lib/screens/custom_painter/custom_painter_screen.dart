import 'package:flutter/material.dart';
import 'package:skill_playground/widgets/circle_painter.dart';

class CustomPainterScreen extends StatefulWidget {
  const CustomPainterScreen({super.key});

  @override
  State<CustomPainterScreen> createState() => _CustomPainterScreenState();
}

class _CustomPainterScreenState extends State<CustomPainterScreen> {
  double _percentage = 0.65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPainter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Center(
            child: CustomPaint(
              size: const Size(220, 220),
              painter: CirclePainter(porcentagem: _percentage),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text('Porcentagem: ${(_percentage * 100).toStringAsFixed(0)}%'),
                Slider(
                  value: _percentage,
                  onChanged: (value) => setState(() => _percentage = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
