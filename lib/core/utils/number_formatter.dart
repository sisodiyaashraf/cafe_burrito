String formatCompact(double value) {
  if (value.isNaN || value <= 0) {
    return '0';
  }
  if (value < 1000) {
    return value.floor().toString();
  }

  const suffixes = [
    (1e18, 'Qi'),
    (1e15, 'Qa'),
    (1e12, 'T'),
    (1e9, 'B'),
    (1e6, 'M'),
    (1e3, 'K'),
  ];

  for (final entry in suffixes) {
    final divisor = entry.$1;
    final suffix = entry.$2;
    if (value >= divisor) {
      final scaled = value / divisor;
      final tenthsTotal = (scaled * 10 + 1e-9).floor();
      final whole = tenthsTotal ~/ 10;
      final tenths = tenthsTotal % 10;

      if (tenths == 0) {
        return '$whole$suffix';
      }
      return '$whole.$tenths$suffix';
    }
  }

  return value.floor().toString();
}
