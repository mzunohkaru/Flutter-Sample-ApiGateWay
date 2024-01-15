import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Model with _$Model {
  factory Model({
    int? id,
    String? name,
    bool? isActive,
    List<String>? hobby,
    Address? address,
    
  }) = _Model;

  factory Model.fromJson(Map<String, dynamic> json) =>
      _$ModelFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    String? street,
    String? city,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
