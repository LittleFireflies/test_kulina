import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_kulina/api/models/variant.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'page_url')
  final String pageUrl;
  @JsonKey(name: 'original_page_url')
  final String originalPageUrl;
  final String media;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final int orders;
  @JsonKey(name: 'banner_variant_id')
  final int bannerVariantId;
  final Variant variant;
  @JsonKey(name: 'created_by')
  final int createdBy;
  @JsonKey(name: 'updated_by')
  final int updatedBy;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  Banner({
    required this.id,
    required this.name,
    required this.pageUrl,
    required this.originalPageUrl,
    required this.media,
    required this.isActive,
    required this.orders,
    required this.bannerVariantId,
    required this.variant,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        pageUrl,
        originalPageUrl,
        media,
        isActive,
        orders,
        bannerVariantId,
        variant,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
      ];
}
