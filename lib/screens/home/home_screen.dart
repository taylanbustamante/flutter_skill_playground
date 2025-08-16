import 'package:flutter/material.dart';
import 'package:skill_playground/locator.dart';
import 'package:skill_playground/router/app_router.dart';
import 'package:skill_playground/screens/platform_channels/platform_channels_screen.dart';
import 'package:skill_playground/services/app_injection_service.dart';

class HomeScreen extends StatelessWidget {
  final void Function(AppPage) onOpen;

  const HomeScreen({super.key, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final List<(String, AppPage)> features = <(String, AppPage)>[
      ('CustomPainter Basics', AppPage.painter),
      ('Navigator 2.0 / RouterDelegate', AppPage.router20),
      ('Bloc State Management', AppPage.bloc),
      ('Platform Channels', AppPage.platform),
      ('Performance & Repaints', AppPage.performance),
      ('Async Isolates', AppPage.isolate),
      ('AnimationController Lifecycle', AppPage.animation),
      ('StreamBuilder Error Handling', AppPage.stream),
      ('Custom Slivers', AppPage.slivers),
      ('Dependency Injection (get_it)', AppPage.injection),
    ];

    final AppInjectionService info = sl<AppInjectionService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(info.appName),
        forceMaterialTransparency: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: features.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          final (title, page) = features[index];

          return Card(
            child: ListTile(
              title: Text(title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => onOpen(page),
            ),
          );
        },
      ),
    );
  }
}
