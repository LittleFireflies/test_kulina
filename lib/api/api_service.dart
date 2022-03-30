import 'package:dio/dio.dart';
import 'package:test_kulina/api/models/banner.dart';
import 'package:test_kulina/api/models/data_response.dart';

class ApiService {
  final Dio _dio;

  const ApiService(Dio dio) : _dio = dio;

  static const _baseUrl = 'http://food.mockable.io/v1';

  Future<List<Banner>> getBanners() async {
    final response = await _dio.get('$_baseUrl/banner');

    if (response.statusCode == 200) {
      final data = DataResponse.fromJson(response.data);

      return data.data;
    } else {
      // FIXME: handle error
      throw Exception('Something went wrong');
    }
  }
}
