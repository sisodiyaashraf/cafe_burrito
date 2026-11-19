import 'package:cafe_burrito/core/constants/game_constants.dart';

enum DayPhase {
  morning,
  lunch,
  evening,
  night,
}

DayPhase dayPhaseAt(double secondsIntoDay) {
  if (secondsIntoDay.isNaN || secondsIntoDay <= 0) {
    return DayPhase.morning;
  }
  final normalized = secondsIntoDay % GameConstants.dayLengthSeconds;
  final phaseDuration =
      GameConstants.dayLengthSeconds / GameConstants.dayPhaseCount;
  final index = (normalized / phaseDuration).floor();

  switch (index) {
    case 0:
      return DayPhase.morning;
    case 1:
      return DayPhase.lunch;
    case 2:
      return DayPhase.evening;
    case 3:
    default:
      return DayPhase.night;
  }
}
