import 'package:test_kulina/api/api_service.dart';
import 'package:test_kulina/api/models/banner.dart';

abstract class AppRepository {
  Future<List<Banner>> loadBanners();
}

class AppRepositoryImpl extends AppRepository {
  final ApiService _apiService;

  AppRepositoryImpl(ApiService apiService) : _apiService = apiService;

  @override
  Future<List<Banner>> loadBanners() async {
    return await _apiService.getBanners();
  }
}
