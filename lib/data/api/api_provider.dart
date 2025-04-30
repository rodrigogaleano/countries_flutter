import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/result.dart';
import 'api_host.dart';
import 'endpoint.dart';

abstract class ApiProviderProtocol {
  Future<Result<T>> request<T>({required Endpoint endpoint});
}

final class ApiProvider implements ApiProviderProtocol {
  final Dio _dio = Dio();

  static final ApiProvider instance = ApiProvider._();

  ApiProvider._() {
    _dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));
  }

  @override
  Future<Result<T>> request<T>({required Endpoint endpoint}) async {
    _dio.options.method = endpoint.method;
    _dio.options.baseUrl = ApiHost.baseUrl;
    _dio.options.contentType = ContentType.json.value;

    try {
      final response = await _dio.request(endpoint.path, queryParameters: endpoint.queryParameters);

      return Result.ok(response.data);
    } on DioException catch (error) {
      return Result.error(error);
    }
  }
}
