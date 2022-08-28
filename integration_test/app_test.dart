import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_tests/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'Home Page Test',
    () {
      testWidgets(
        'Clique 5x no Incrementar',
        (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          for (var i = 0; i < 3; i++) {
            await tester.tap(find.byIcon(Icons.plus_one));
            await Future.delayed(const Duration(seconds: 1));
          }
          await tester.pumpAndSettle();

          expect(find.text('3'), findsOneWidget);
        },
      );
    },
  );

  testWidgets(
    'Escreva no campo de texto para alterar o titulo da pagina',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      var titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
      expect(titulo.data, equals('Home'));

      // Possível bug do enterText no iPad (por conta do keyboard)
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byKey(const Key('tituloInput')), 'Home Page');
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
      expect(titulo.data, equals('Home Page'));
    },
  );
}

// flutter test integration_test/app_test.dart -d ce0217129927783205 