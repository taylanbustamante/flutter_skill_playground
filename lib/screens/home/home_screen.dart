import 'package:flutter/material.dart';

import '../bloc_counter/bloc_counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = <String>[
      'CustomPainter Basics',
      'Navigator 2.0 / RouterDelegate',
      'Bloc State Management',
      'Platform Channels',
      'Performance & Repaints',
      'Async Isolates',
      'AnimationController Lifecycle',
      'StreamBuilder Error Handling',
      'Custom Slivers',
      'Dependency Injection (get_it)',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Skill Playground')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: features.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(features[index]),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async => await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlocCounterScreen()),
              ),
            ),
          );
        },
      ),
    );
  }
}
