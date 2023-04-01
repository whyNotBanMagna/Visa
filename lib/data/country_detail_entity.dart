import 'package:fuwei/generated/json/base/json_field.dart';
import 'package:fuwei/generated/json/country_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CountryDetailEntity {
  late int id;
  @JSONField(name: "country_name")
  late String countryName;
  @JSONField(name: "country_img_url")
  late String countryImgUrl;
  @JSONField(name: "country_content")
  late String countryContent;
  @JSONField(name: "country_visit_visa_url")
  late List<CountryDetailCountryVisitVisaUrl> countryVisitVisaUrl;

  CountryDetailEntity();

  factory CountryDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CountryDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryDetailCountryVisitVisaUrl {
  @JSONField(name: "file_name")
  late String fileName;
  @JSONField(name: "file_url")
  late String fileUrl;

  CountryDetailCountryVisitVisaUrl();

  factory CountryDetailCountryVisitVisaUrl.fromJson(
          Map<String, dynamic> json) =>
      $CountryDetailCountryVisitVisaUrlFromJson(json);

  Map<String, dynamic> toJson() =>
      $CountryDetailCountryVisitVisaUrlToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
