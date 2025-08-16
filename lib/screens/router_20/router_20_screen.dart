import 'package:flutter/material.dart';
import '../../router/app_router.dart';

class Router20Screen extends StatelessWidget {
  const Router20Screen({super.key, required this.onOpen});
  final void Function(AppPage) onOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator 2.0 / RouterDelegate')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onOpen(AppPage.painter),
              child: const Text('Ir para CustomPainterScreen (programático)'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => onOpen(AppPage.bloc),
              child: const Text('Ir para BlocCounterScreen (programático)'),
            ),
          ],
        ),
      ),
    );
  }
}
