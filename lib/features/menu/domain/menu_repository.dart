import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

abstract interface class MenuRepository {
  List<StationDefinition> get stations;
  List<MenuItem> get allItems;
  StationDefinition stationById(String id);
  MenuItem itemById(String id);
  StationDefinition stationOfItem(String itemId);
}
