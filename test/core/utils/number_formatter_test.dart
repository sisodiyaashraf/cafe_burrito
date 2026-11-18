import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/core/utils/number_formatter.dart';

void main() {
  group('formatCompact', () {
    test('formats zero and negative numbers as 0', () {
      expect(formatCompact(0), '0');
      expect(formatCompact(-5), '0');
      expect(formatCompact(double.nan), '0');
    });

    test('formats numbers below 1000 without decimals', () {
      expect(formatCompact(999), '999');
      expect(formatCompact(999.9), '999');
    });

    test('formats thousands with K suffix', () {
      expect(formatCompact(1000), '1K');
      expect(formatCompact(1001), '1K');
      expect(formatCompact(1250), '1.2K');
      expect(formatCompact(999999), '999.9K');
    });

    test('formats millions with M suffix', () {
      expect(formatCompact(1000000), '1M');
      expect(formatCompact(1250000), '1.2M');
      expect(formatCompact(15000000), '15M');
    });

    test('formats billions with B suffix', () {
      expect(formatCompact(2300000000), '2.3B');
    });

    test('formats values at or above 1e21 with Qi suffix', () {
      expect(formatCompact(1e21), '1000Qi');
    });
  });
}
