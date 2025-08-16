import 'package:flutter/material.dart';
import 'package:skill_playground/locator.dart';
import 'package:skill_playground/router/app_router.dart';
import 'package:skill_playground/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(const SkillPlaygroundApp());
}

class SkillPlaygroundApp extends StatelessWidget {
  const SkillPlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Skill Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerDelegate: AppRouter(),
      routeInformationParser: AppRouteParser(),
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
