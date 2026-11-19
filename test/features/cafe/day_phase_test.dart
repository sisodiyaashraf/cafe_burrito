import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/features/cafe/domain/day_phase.dart';

void main() {
  group('dayPhaseAt', () {
    test('resolves day phases and wraps correctly', () {
      expect(dayPhaseAt(0), DayPhase.morning);
      expect(dayPhaseAt(119.9), DayPhase.morning);
      expect(dayPhaseAt(120), DayPhase.lunch);
      expect(dayPhaseAt(239.9), DayPhase.lunch);
      expect(dayPhaseAt(240), DayPhase.evening);
      expect(dayPhaseAt(359.9), DayPhase.evening);
      expect(dayPhaseAt(360), DayPhase.night);
      expect(dayPhaseAt(479.9), DayPhase.night);
      expect(dayPhaseAt(480), DayPhase.morning);
      expect(dayPhaseAt(600), DayPhase.lunch);
      expect(dayPhaseAt(-5), DayPhase.morning);
      expect(dayPhaseAt(double.nan), DayPhase.morning);
    });
  });
}
