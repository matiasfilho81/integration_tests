import 'package:flutter/material.dart';
import 'package:integration_tests/pages/home/home_page.dart';
import 'package:integration_tests/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste de Integração',
      theme: AppTheme.theme,
      home: HomePage(),
    );
  }
}
