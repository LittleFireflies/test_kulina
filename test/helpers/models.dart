import 'package:test_kulina/api/models/banner.dart';
import 'package:test_kulina/api/models/variant.dart';

class TestModels {
  static const Variant variant = Variant(
    id: 1,
    name: 'name',
    slug: 'slug',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
  );

  static final Banner banner = Banner(
    id: 1,
    name: 'name',
    pageUrl: 'pageUrl',
    originalPageUrl: 'originalPageUrl',
    media: 'media',
    isActive: true,
    orders: 0,
    bannerVariantId: 0,
    variant: variant,
    createdBy: 0,
    updatedBy: 0,
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
  );
}
