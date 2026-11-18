import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/widgets/placeholder_panel.dart';

class CafeScreen extends StatelessWidget {
  const CafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPanel(
      icon: Icons.local_cafe_rounded,
      title: 'Your Cafe',
      subtitle: 'The cafe scene arrives in Step 5.',
    );
  }
}
