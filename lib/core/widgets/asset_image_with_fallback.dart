import 'package:flutter/material.dart';

class AssetImageWithFallback extends StatelessWidget {
  const AssetImageWithFallback({
    super.key,
    required this.assetPath,
    required this.fallback,
    this.size,
    this.fit = BoxFit.contain,
  });

  final String assetPath;
  final Widget fallback;
  final double? size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => fallback,
    );
  }
}
