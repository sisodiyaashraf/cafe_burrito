import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/widgets/placeholder_panel.dart';

class RegularsScreen extends StatelessWidget {
  const RegularsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPanel(
      icon: Icons.pets_rounded,
      title: 'Regulars',
      subtitle: 'Meet your favorite customers here in a later step.',
    );
  }
}
