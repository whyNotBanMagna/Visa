import 'package:fuwei/generated/json/base/json_field.dart';
import 'package:fuwei/generated/json/continent_entity.g.dart';
import 'dart:convert';

///几大洲
@JsonSerializable()
class ContinentEntity {
  late int id;
  @JSONField(name: "part_name")
  late String partName;
  @JSONField(name: "part_code")
  late String partCode;

  ContinentEntity();

  factory ContinentEntity.fromJson(Map<String, dynamic> json) =>
      $ContinentEntityFromJson(json);

  Map<String, dynamic> toJson() => $ContinentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
