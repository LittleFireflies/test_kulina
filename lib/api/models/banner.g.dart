// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      id: json['id'] as int,
      name: json['name'] as String,
      pageUrl: json['page_url'] as String,
      originalPageUrl: json['original_page_url'] as String,
      media: json['media'] as String,
      isActive: json['is_active'] as bool,
      orders: json['orders'] as int,
      bannerVariantId: json['banner_variant_id'] as int,
      variant: Variant.fromJson(json['variant'] as Map<String, dynamic>),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'page_url': instance.pageUrl,
      'original_page_url': instance.originalPageUrl,
      'media': instance.media,
      'is_active': instance.isActive,
      'orders': instance.orders,
      'banner_variant_id': instance.bannerVariantId,
      'variant': instance.variant,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
