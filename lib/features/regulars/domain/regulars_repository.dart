import 'package:cafe_burrito/features/regulars/domain/regular.dart';

abstract interface class RegularsRepository {
  List<Regular> get regulars;
  Regular regularById(String id);
  List<Regular> regularsWhoLove(String itemId);
}
