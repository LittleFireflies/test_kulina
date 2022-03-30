import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant extends Equatable {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const Variant({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        createdAt,
        updatedAt,
      ];
}
