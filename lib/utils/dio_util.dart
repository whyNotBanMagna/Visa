import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fuwei/config/config.dart';
import 'package:fuwei/data/base_model_entity.dart';
import 'package:fuwei/data/continent_entity.dart';
import 'package:fuwei/data/country_detail_entity.dart';
import 'package:fuwei/data/country_entity.dart';
import 'package:fuwei/data/web_config_entity.dart';

class NetworkUtil {
  ///获取几大洲列表
  Future<List<ContinentEntity>> getContinentList() async {
    var response =
        await Dio().get("${AppConfig.baseUrl}api/home/visa/part/list");
    var data = json.decode(response.toString());
    return BaseModelEntity<List<ContinentEntity>>.fromJson(data).data;
  }

  ///获取每个洲对应国家列表
  Future<List<CountryEntity>> getCountryList(int id) async {
    var queryParams = {"part_id": id};
    var response = await Dio().get(
        "${AppConfig.baseUrl}/api/home/visa/country/list",
        queryParameters: queryParams);
    var data = json.decode(response.toString());
    return BaseModelEntity<List<CountryEntity>>.fromJson(data).data;
  }

  ///获取国家详情
  Future<CountryDetailEntity> getCountryDetail(int id) async {
    var queryParams = {"country_id": id};
    var response = await Dio().get(
        "${AppConfig.baseUrl}api/home/visa/country/detail",
        queryParameters: queryParams);
    var data = json.decode(response.toString());
    return BaseModelEntity<CountryDetailEntity>.fromJson(data).data;
  }

  ///获取网站配置信息
  Future<WebConfigEntity> getWebConfig() async {
    var response =
        await Dio().get("${AppConfig.baseUrl}api/home/visa/web/config");
    var data = json.decode(response.toString());
    return BaseModelEntity<WebConfigEntity>.fromJson(data).data;
  }
}
