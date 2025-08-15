import 'package:flutter/material.dart';
import 'package:skill_playground/locator.dart';
import 'package:skill_playground/services/app_injection_service.dart';

class DependencyInjectionScreen extends StatelessWidget {
  const DependencyInjectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppInjectionService info = sl<AppInjectionService>();
    return Scaffold(
      appBar: AppBar(title: const Text('Dependency Injection (get_it)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App: ${info.appName}\nBoot: ${info.bootedAt}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 10),
            Text('Dependência está sendo utilizada na HomeScreen'),
          ],
        ),
      ),
    );
  }
}
