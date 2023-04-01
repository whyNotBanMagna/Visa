import 'package:fuwei/generated/json/base/json_field.dart';
import 'package:fuwei/generated/json/base_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BaseModelEntity<T> {
  late int code;
  late String msg;
  late T data;

  BaseModelEntity();

  factory BaseModelEntity.fromJson(Map<String, dynamic> json) =>
      $BaseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseModelEntityToJson(this);

  BaseModelEntity copyWith({int? code, String? msg, String? data}) {
    return BaseModelEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
