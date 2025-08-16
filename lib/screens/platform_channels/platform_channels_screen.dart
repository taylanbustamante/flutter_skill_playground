import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannelsScreen extends StatefulWidget {
  const PlatformChannelsScreen({super.key});
  @override
  State<PlatformChannelsScreen> createState() => _PlatformChannelsScreenState();
}

class _PlatformChannelsScreenState extends State<PlatformChannelsScreen> {
  final MethodChannel _channel = MethodChannel('playground/native');
  String? _platformVersion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Platform Channels')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _getPlatformVersion,
              child: const Text('Perguntar versão do SO nativo'),
            ),
            const SizedBox(height: 12),
            Text('Resposta: ${_platformVersion ?? ''}'),
          ],
        ),
      ),
    );
  }

  Future<void> _getPlatformVersion() async {
    try {
      final String v = await _channel.invokeMethod('platformVersion');
      setState(() => _platformVersion = v);
    } catch (e) {
      setState(() => _platformVersion = 'Erro: $e');
    }
  }
}
