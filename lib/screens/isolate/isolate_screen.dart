import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  bool _running = false;
  String _result = 'Qual o total números primos menor/igual que 1.200.000?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _running ? null : _runTask,
              child: const Text('Executar tarefa pesada'),
            ),
            const SizedBox(height: 12),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 12),
            _running ? const CircularProgressIndicator() : SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _runTask() async {
    setState(() => _running = true);
    try {
      final int primes = await compute(countPrimesUpTo, 1200000);
      setState(
        () => _result = 'O total de números primos <= 1.200.000: \n$primes',
      );
    } catch (e) {
      setState(() => _result = 'Erro: $e');
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }
}

int countPrimesUpTo(int n) {
  int count = 0;
  for (int i = 2; i <= n; i++) {
    bool isPrime = true;
    for (int d = 2; d <= sqrt(i); d++) {
      if (i % d == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) count++;
  }
  return count;
}
