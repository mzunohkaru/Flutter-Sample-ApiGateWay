import 'package:dio/dio.dart';
import 'package:flutter_api_sample/mocks/api.dart';
import 'package:flutter_api_sample/mocks/model/model.dart';

class ApiClient {
  Future<List<Model>?> fetchMockData() async {
    final dio = Dio();
    final url = urlAGW;
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      try {
        final data = response.data['users'] as List;
        final list = data.map((e) => Model.fromJson(e)).toList();
        return list;
      } catch (e) {
        throw e;
      }
    }
  }
}