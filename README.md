# Flutter Skill Playground

[![Flutter](https://img.shields.io/badge/Flutter-3.32-blue?logo=flutter)](https://flutter.dev)

Mini-app criado para demonstrar, de forma prática, diferentes recursos do Flutter.

O app apresenta uma **Home** com cards, onde cada card abre uma tela que exemplifica um tema específico.

---

## 🚀 Como rodar o projeto
```bash
flutter pub get
flutter run
```

---

## 📂 Estrutura
```
lib/
 ├─ main.dart              # Ponto de entrada
 ├─ locator.dart           # Setup do get_it
 ├─ router/app_router.dart # RouterDelegate + RouteInformationParser
 ├─ screens/               # Cada tela de demonstração
 │   ├─ home/
 │   ├─ custom_painter/
 │   ├─ router20/
 │   ├─ bloc_counter/
 │   ├─ platform_channels/
 │   ├─ performance/
 │   ├─ isolate/
 │   ├─ animation/
 │   ├─ stream_builder/
 │   ├─ slivers/
 │   └─ di/
 └─ services/              # Serviços (ex: AppInfoService)
```

---

## 📝 Guia rápido das telas

### 1. Home
- Lista de cards que levam para cada exemplo.

### 2. CustomPainter Basics
- Desenha formas no canvas.
- Classe que extend `CustomPainter`, com override `paint()` e `shouldRepaint()`.

### 3. Navigator 2.0 / RouterDelegate
- Implementa `RouterDelegate` e `RouteInformationParser`.
- Botões navegam **programaticamente** entre duas telas de exemplo (CustomPainterScreen e BlocCounterScreen).

### 4. Bloc State Management
- Usa `BlocBuilder` com `buildWhen` para reconstruir somente em certas condições.
- Contador que só incrementa se permitido e atualiza a UI apenas quando o valor é par.

### 5. Platform Channels
- Envia mensagem ao código nativo via `MethodChannel`.
- Responde com a versão do SO (Android/iOS).

### 6. Performance & Repaints
- Renderiza lista grande com `RepaintBoundary` para evitar repaints desnecessários.

### 7. Async Isolates
- Executa tarefa de CPU pesada (contar primos) usando `compute()`.
- Exibe resultado ao usuário.

### 8. AnimationController Lifecycle
- Animação simples com `AnimationController`.
- Controller corretamente descartado no `dispose()`.

### 9. StreamBuilder Error Handling
- Stream que emite valores e lança erro.
- Tratamento de `snapshot.hasError` exibe mensagem customizada.

### 10. Custom Slivers
- Usa `CustomScrollView` com `SliverToBoxAdapter` e `SliverList`.

### 11. Dependency Injection (get_it)
- Serviço `AppInfoService` registrado em `locator.dart`.
- Consumido em tela para exibir informações do app e na HomeScreen.

---

## 🧪 Testes
- **Unitários**:  
  - `countPrimesUpTo` (Isolate).  
  - `BlocCounterTest`.

Rodar todos:
```bash
flutter test
```

---

## 📦 Dependências
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) → gerenciamento de estado.  
- [get_it](https://pub.dev/packages/get_it) → injeção de dependências.

---

## 📚 Notas
- CI configurado em `.github/workflows/flutter_ci.yml` para build, analyze e test.

---
