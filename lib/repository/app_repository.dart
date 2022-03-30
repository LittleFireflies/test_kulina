import 'package:test_kulina/api/models/banner.dart';

abstract class AppRepository {
  Future<List<Banner>> loadBanners();
}
