import 'package:fuwei/generated/json/base/json_convert_content.dart';
import 'package:fuwei/data/base_model_entity.dart';

BaseModelEntity<T> $BaseModelEntityFromJson<T>(Map<String, dynamic> json) {
  final BaseModelEntity<T> baseModelEntity = BaseModelEntity<T>();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    baseModelEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    baseModelEntity.msg = msg;
  }
  final T? data = JsonConvert.fromJsonAsT(json['data']);
  if (data != null) {
    baseModelEntity.data = data;
  }
  return baseModelEntity;
}

Map<String, dynamic> $BaseModelEntityToJson(BaseModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data;
  return data;
}
