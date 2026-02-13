import 'package:dio/dio.dart';
import 'package:gold_pricing/core/networking/api_constants.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio);

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
