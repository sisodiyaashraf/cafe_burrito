import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/theme/app_theme.dart';
import 'package:cafe_burrito/features/cafe/presentation/app_shell.dart';

class CafeBurritoApp extends StatelessWidget {
  const CafeBurritoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Burrito',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}
