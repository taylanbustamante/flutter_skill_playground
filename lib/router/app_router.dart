import 'package:flutter/material.dart';
import 'package:skill_playground/screens/animation_controller/animation_controller_screen.dart';
import 'package:skill_playground/screens/bloc_counter/bloc_counter_screen.dart';
import 'package:skill_playground/screens/custom_painter/custom_painter_screen.dart';
import 'package:skill_playground/screens/custom_slivers/custom_slivers_screen.dart';
import 'package:skill_playground/screens/dependency_injection/dependency_injection_screen.dart';
import 'package:skill_playground/screens/home/home_screen.dart';
import 'package:skill_playground/screens/isolate/isolate_screen.dart';
import 'package:skill_playground/screens/perfomance_repaint/perfomance_repaint_screen.dart';
import 'package:skill_playground/screens/platform_channels/platform_channels_screen.dart';
import 'package:skill_playground/screens/router_20/router_20_screen.dart';
import 'package:skill_playground/screens/stream_builder/stream_builder_screen.dart';

enum AppPage {
  animation,
  bloc,
  painter,
  slivers,
  injection,
  home,
  isolate,
  performance,
  platform,
  router20,
  stream,
}

class AppRoutePath {
  final AppPage page;
  AppRoutePath(this.page);

  static AppRoutePath fromLocation(String? location) {
    switch (location) {
      case '/painter':
        return AppRoutePath(AppPage.painter);
      case '/router20':
        return AppRoutePath(AppPage.router20);
      case '/bloc':
        return AppRoutePath(AppPage.bloc);
      case '/platform':
        return AppRoutePath(AppPage.platform);
      case '/performance':
        return AppRoutePath(AppPage.performance);
      case '/isolate':
        return AppRoutePath(AppPage.isolate);
      case '/animation':
        return AppRoutePath(AppPage.animation);
      case '/stream':
        return AppRoutePath(AppPage.stream);
      case '/slivers':
        return AppRoutePath(AppPage.slivers);
      case '/injection':
        return AppRoutePath(AppPage.injection);
      default:
        return AppRoutePath(AppPage.home);
    }
  }

  String get location {
    switch (page) {
      case AppPage.painter:
        return '/painter';
      case AppPage.router20:
        return '/router20';
      case AppPage.bloc:
        return '/bloc';
      case AppPage.platform:
        return '/platform';
      case AppPage.performance:
        return '/performance';
      case AppPage.isolate:
        return '/isolate';
      case AppPage.animation:
        return '/animation';
      case AppPage.stream:
        return '/stream';
      case AppPage.slivers:
        return '/slivers';
      case AppPage.injection:
        return '/injection';
      case AppPage.home:
        return '/';
    }
  }
}

class AppRouteParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return AppRoutePath.fromLocation(routeInformation.uri.path);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    return RouteInformation(uri: Uri.parse(configuration.location));
  }
}

class AppRouter extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppPage _current = AppPage.home;

  @override
  AppRoutePath get currentConfiguration => AppRoutePath(_current);

  void go(AppPage page) {
    _current = page;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('home'),
          child: HomeScreen(onOpen: go),
        ),
        if (_current == AppPage.painter)
          const MaterialPage(child: CustomPainterScreen()),
        if (_current == AppPage.router20)
          MaterialPage(child: Router20Screen(onOpen: go)),
        if (_current == AppPage.bloc)
          const MaterialPage(child: BlocCounterScreen()),
        if (_current == AppPage.platform)
          const MaterialPage(child: PlatformChannelsScreen()),
        if (_current == AppPage.performance)
          const MaterialPage(child: PerformanceRepaintScreen()),
        if (_current == AppPage.isolate)
          const MaterialPage(child: IsolateScreen()),
        if (_current == AppPage.animation)
          const MaterialPage(child: AnimationControllerScreen()),
        if (_current == AppPage.stream)
          const MaterialPage(child: StreamErrorScreen()),
        if (_current == AppPage.slivers)
          const MaterialPage(child: CustomSliversScreen()),
        if (_current == AppPage.injection)
          const MaterialPage(child: DependencyInjectionScreen()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _current = AppPage.home;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _current = configuration.page;
  }
}
