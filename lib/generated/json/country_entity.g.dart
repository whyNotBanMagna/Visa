import 'package:fuwei/generated/json/base/json_convert_content.dart';
import 'package:fuwei/data/country_entity.dart';

CountryEntity $CountryEntityFromJson(Map<String, dynamic> json) {
  final CountryEntity countryEntity = CountryEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    countryEntity.id = id;
  }
  final String? countryName = jsonConvert.convert<String>(json['country_name']);
  if (countryName != null) {
    countryEntity.countryName = countryName;
  }
  final String? countryImgUrl =
      jsonConvert.convert<String>(json['country_img_url']);
  if (countryImgUrl != null) {
    countryEntity.countryImgUrl = countryImgUrl;
  }
  return countryEntity;
}

Map<String, dynamic> $CountryEntityToJson(CountryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['country_name'] = entity.countryName;
  data['country_img_url'] = entity.countryImgUrl;
  return data;
}
