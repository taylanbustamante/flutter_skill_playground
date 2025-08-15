import 'package:flutter_test/flutter_test.dart';
import 'package:skill_playground/screens/isolate/isolate_screen.dart';

void main() {
  test('Testando a countPrimesUpTo se calcula corretamente para 20', () {
    expect(countPrimesUpTo(20), 8);
  });
}
