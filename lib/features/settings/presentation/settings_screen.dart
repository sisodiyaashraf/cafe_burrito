import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/widgets/placeholder_panel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const PlaceholderPanel(
        icon: Icons.tune_rounded,
        title: 'Settings',
        subtitle: 'Sound and privacy options arrive in a later step.',
      ),
    );
  }
}
