import 'package:fuwei/generated/json/base/json_field.dart';
import 'package:fuwei/generated/json/country_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CountryEntity {
  late int id;
  @JSONField(name: "country_name")
  late String countryName;
  @JSONField(name: "country_img_url")
  late String countryImgUrl;

  CountryEntity();

  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      $CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
