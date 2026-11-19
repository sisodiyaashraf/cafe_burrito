import 'package:cafe_burrito/features/menu/data/menu_catalog.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/menu_repository.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

class ConstMenuRepository implements MenuRepository {
  ConstMenuRepository([List<StationDefinition>? stations])
      : _stations = stations ?? menuStations {
    for (final station in _stations) {
      _stationById[station.id] = station;
      for (final item in station.items) {
        _itemById[item.id] = item;
        _stationByItemId[item.id] = station;
        _allItems.add(item);
      }
    }
  }

  final List<StationDefinition> _stations;
  final List<MenuItem> _allItems = [];
  final Map<String, StationDefinition> _stationById = {};
  final Map<String, MenuItem> _itemById = {};
  final Map<String, StationDefinition> _stationByItemId = {};

  @override
  List<StationDefinition> get stations => List.unmodifiable(_stations);

  @override
  List<MenuItem> get allItems => List.unmodifiable(_allItems);

  @override
  StationDefinition stationById(String id) {
    final station = _stationById[id];
    if (station == null) {
      throw ArgumentError('Unknown station id: $id');
    }
    return station;
  }

  @override
  MenuItem itemById(String id) {
    final item = _itemById[id];
    if (item == null) {
      throw ArgumentError('Unknown item id: $id');
    }
    return item;
  }

  @override
  StationDefinition stationOfItem(String itemId) {
    final station = _stationByItemId[itemId];
    if (station == null) {
      throw ArgumentError('Unknown item id for station lookup: $itemId');
    }
    return station;
  }
}
