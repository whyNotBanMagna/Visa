import 'package:fuwei/generated/json/base/json_field.dart';
import 'package:fuwei/generated/json/web_config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WebConfigEntity {
  @JSONField(name: "config_phone")
  late String configPhone;
  @JSONField(name: "config_address")
  late String configAddress;
  @JSONField(name: "config_wechat_url")
  late String configWechatUrl;
  @JSONField(name: "config_web_name")
  late String configWebName;
  @JSONField(name: "config_web_beian")
  late String configWebBeian;
  @JSONField(name: "config_web_zhuti")
  late String configWebZhuti;
  @JSONField(name: "config_content")
  late String configContent;

  WebConfigEntity();

  factory WebConfigEntity.fromJson(Map<String, dynamic> json) =>
      $WebConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $WebConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
