import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/config/themes/app_theme.dart';
import 'package:provider_test/presentation/providers/text_provider.dart';
import 'package:provider_test/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TextProvider())],
      child: MaterialApp(
        title: 'To do list',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const HomeScreen(),
      ),
    );
  }
}
