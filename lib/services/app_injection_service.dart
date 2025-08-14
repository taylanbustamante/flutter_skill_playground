class AppInjectionService {
  final DateTime _boot = DateTime.now();
  String get appName => 'Flutter Skill Playground';
  String get bootedAt => _boot.toIso8601String();
}
