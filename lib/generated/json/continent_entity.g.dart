import 'package:fuwei/generated/json/base/json_convert_content.dart';
import 'package:fuwei/data/continent_entity.dart';

ContinentEntity $ContinentEntityFromJson(Map<String, dynamic> json) {
  final ContinentEntity continentEntity = ContinentEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    continentEntity.id = id;
  }
  final String? partName = jsonConvert.convert<String>(json['part_name']);
  if (partName != null) {
    continentEntity.partName = partName;
  }
  final String? partCode = jsonConvert.convert<String>(json['part_code']);
  if (partCode != null) {
    continentEntity.partCode = partCode;
  }
  return continentEntity;
}

Map<String, dynamic> $ContinentEntityToJson(ContinentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['part_name'] = entity.partName;
  data['part_code'] = entity.partCode;
  return data;
}
