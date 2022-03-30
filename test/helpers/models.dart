import 'package:test_kulina/api/models/banner.dart';
import 'package:test_kulina/api/models/variant.dart';

class TestModels {
  static const Variant smallVariant = Variant(
    id: 1,
    name: 'Small',
    slug: 'small',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
  );

  static const Variant topVariant = Variant(
    id: 2,
    name: 'Top',
    slug: 'top',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
  );

  static final Banner smallBanner = Banner(
    id: 1,
    name: 'name',
    pageUrl: 'pageUrl',
    originalPageUrl: 'originalPageUrl',
    media: 'media',
    isActive: true,
    orders: 0,
    bannerVariantId: 0,
    variant: smallVariant,
    createdBy: 0,
    updatedBy: 0,
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
  );

  static final Banner topBanner = Banner(
    id: 2,
    name: 'name',
    pageUrl: 'pageUrl',
    originalPageUrl: 'originalPageUrl',
    media: 'media',
    isActive: true,
    orders: 0,
    bannerVariantId: 0,
    variant: topVariant,
    createdBy: 0,
    updatedBy: 0,
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
  );
}
