import 'package:flutter/material.dart';

class PerformanceRepaintScreen extends StatefulWidget {
  const PerformanceRepaintScreen({super.key});

  @override
  State<PerformanceRepaintScreen> createState() =>
      _PerformanceRepaintScreenState();
}

class _PerformanceRepaintScreenState extends State<PerformanceRepaintScreen> {
  final List items = List.generate(500, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance & Repaints'),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Text(
              'Lista com 500 elementos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) => RepaintBoundary(
                  child: ListTile(
                    title: Text('Item nº $index'),
                    leading: const Icon(Icons.arrow_forward_rounded),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
