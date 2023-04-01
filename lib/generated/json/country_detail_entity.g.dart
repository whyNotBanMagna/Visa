import 'package:fuwei/generated/json/base/json_convert_content.dart';
import 'package:fuwei/data/country_detail_entity.dart';

CountryDetailEntity $CountryDetailEntityFromJson(Map<String, dynamic> json) {
  final CountryDetailEntity countryDetailEntity = CountryDetailEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    countryDetailEntity.id = id;
  }
  final String? countryName = jsonConvert.convert<String>(json['country_name']);
  if (countryName != null) {
    countryDetailEntity.countryName = countryName;
  }
  final String? countryImgUrl =
      jsonConvert.convert<String>(json['country_img_url']);
  if (countryImgUrl != null) {
    countryDetailEntity.countryImgUrl = countryImgUrl;
  }
  final String? countryContent =
      jsonConvert.convert<String>(json['country_content']);
  if (countryContent != null) {
    countryDetailEntity.countryContent = countryContent;
  }
  final List<CountryDetailCountryVisitVisaUrl>? countryVisitVisaUrl =
      jsonConvert.convertListNotNull<CountryDetailCountryVisitVisaUrl>(
          json['country_visit_visa_url']);
  if (countryVisitVisaUrl != null) {
    countryDetailEntity.countryVisitVisaUrl = countryVisitVisaUrl;
  }
  return countryDetailEntity;
}

Map<String, dynamic> $CountryDetailEntityToJson(CountryDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['country_name'] = entity.countryName;
  data['country_img_url'] = entity.countryImgUrl;
  data['country_content'] = entity.countryContent;
  data['country_visit_visa_url'] =
      entity.countryVisitVisaUrl.map((v) => v.toJson()).toList();
  return data;
}

CountryDetailCountryVisitVisaUrl $CountryDetailCountryVisitVisaUrlFromJson(
    Map<String, dynamic> json) {
  final CountryDetailCountryVisitVisaUrl countryDetailCountryVisitVisaUrl =
      CountryDetailCountryVisitVisaUrl();
  final String? fileName = jsonConvert.convert<String>(json['file_name']);
  if (fileName != null) {
    countryDetailCountryVisitVisaUrl.fileName = fileName;
  }
  final String? fileUrl = jsonConvert.convert<String>(json['file_url']);
  if (fileUrl != null) {
    countryDetailCountryVisitVisaUrl.fileUrl = fileUrl;
  }
  return countryDetailCountryVisitVisaUrl;
}

Map<String, dynamic> $CountryDetailCountryVisitVisaUrlToJson(
    CountryDetailCountryVisitVisaUrl entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['file_name'] = entity.fileName;
  data['file_url'] = entity.fileUrl;
  return data;
}
