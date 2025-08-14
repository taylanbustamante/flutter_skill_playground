import 'package:flutter/material.dart';
import 'package:skill_playground/locator.dart';
import 'package:skill_playground/screens/perfomance_repaint/perfomance_repaint_screen.dart';
import 'package:skill_playground/services/app_injection_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = <String>[
      'CustomPainter Basics', //ja foi
      'Navigator 2.0 / RouterDelegate',
      'Bloc State Management', //ja foi
      'Platform Channels',
      'Performance & Repaints', //ja foi
      'Async Isolates',
      'AnimationController Lifecycle', //ja foi
      'StreamBuilder Error Handling',
      'Custom Slivers',
      'Dependency Injection (get_it)', //ja foi
    ];

    final info = sl<AppInjectionService>();

    return Scaffold(
      appBar: AppBar(title: Text(info.appName)),
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
                MaterialPageRoute(
                  builder: (context) => PerformanceRepaintScreen(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
