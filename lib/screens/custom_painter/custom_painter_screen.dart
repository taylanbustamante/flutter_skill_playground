import 'package:flutter/material.dart';
import 'package:skill_playground/widgets/circle_painter.dart';

class CustomPainterScreen extends StatefulWidget {
  const CustomPainterScreen({super.key});

  @override
  State<CustomPainterScreen> createState() => _CustomPainterScreenState();
}

class _CustomPainterScreenState extends State<CustomPainterScreen> {
  double porcentagem = 0.65;

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
              painter: CirclePainter(porcentagem: porcentagem),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text('Porcentagem: ${(porcentagem * 100).toStringAsFixed(0)}%'),
                Slider(
                  value: porcentagem,
                  onChanged: (value) => setState(() => porcentagem = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
