import 'dart:async';
import 'package:flutter/material.dart';

class StreamErrorScreen extends StatefulWidget {
  const StreamErrorScreen({super.key});

  @override
  State<StreamErrorScreen> createState() => _StreamErrorScreenState();
}

class _StreamErrorScreenState extends State<StreamErrorScreen> {
  Stream<int>? stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamBuilder')),
      body: Center(
        child: StreamBuilder<int>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    'Ops! Algo deu errado na stream.\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () =>
                        setState(() => stream = streamWithError(true)),
                    child: const Text('Tentar novamente'),
                  ),
                ],
              );
            }

            if (snapshot.data == null) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Será exibido um erro simulado no item 3.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () =>
                        setState(() => stream = streamWithError(false)),
                    child: const Text('Iniciar simulação'),
                  ),
                ],
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Chegou ao final.', textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () =>
                        setState(() => stream = streamWithError(false)),
                    child: const Text('Reiniciar simulação'),
                  ),
                ],
              );
            }

            return Text(
              'Valor: ${snapshot.data}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}

Stream<int> streamWithError(bool restart) async* {
  for (var i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(milliseconds: 600));
    if (i == 3 && !restart) {
      throw Exception('Falha simulada no item $i');
    }
    yield i;
  }
}
