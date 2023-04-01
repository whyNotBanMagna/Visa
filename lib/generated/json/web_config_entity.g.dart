import 'package:fuwei/generated/json/base/json_convert_content.dart';
import 'package:fuwei/data/web_config_entity.dart';

WebConfigEntity $WebConfigEntityFromJson(Map<String, dynamic> json) {
  final WebConfigEntity webConfigEntity = WebConfigEntity();
  final String? configPhone = jsonConvert.convert<String>(json['config_phone']);
  if (configPhone != null) {
    webConfigEntity.configPhone = configPhone;
  }
  final String? configAddress =
      jsonConvert.convert<String>(json['config_address']);
  if (configAddress != null) {
    webConfigEntity.configAddress = configAddress;
  }
  final String? configWechatUrl =
      jsonConvert.convert<String>(json['config_wechat_url']);
  if (configWechatUrl != null) {
    webConfigEntity.configWechatUrl = configWechatUrl;
  }
  final String? configWebName =
      jsonConvert.convert<String>(json['config_web_name']);
  if (configWebName != null) {
    webConfigEntity.configWebName = configWebName;
  }
  final String? configWebBeian =
      jsonConvert.convert<String>(json['config_web_beian']);
  if (configWebBeian != null) {
    webConfigEntity.configWebBeian = configWebBeian;
  }
  final String? configWebZhuti =
      jsonConvert.convert<String>(json['config_web_zhuti']);
  if (configWebZhuti != null) {
    webConfigEntity.configWebZhuti = configWebZhuti;
  }
  final String? configContent =
      jsonConvert.convert<String>(json['config_content']);
  if (configContent != null) {
    webConfigEntity.configContent = configContent;
  }
  return webConfigEntity;
}

Map<String, dynamic> $WebConfigEntityToJson(WebConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['config_phone'] = entity.configPhone;
  data['config_address'] = entity.configAddress;
  data['config_wechat_url'] = entity.configWechatUrl;
  data['config_web_name'] = entity.configWebName;
  data['config_web_beian'] = entity.configWebBeian;
  data['config_web_zhuti'] = entity.configWebZhuti;
  data['config_content'] = entity.configContent;
  return data;
}
