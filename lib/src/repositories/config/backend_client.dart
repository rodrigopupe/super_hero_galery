import 'package:dio/dio.dart';
import 'package:superherogalery/src/repositories/config/backend_config.dart';

class BackendClient {
  final Dio handler = Dio();

  BackendClient() {
    handler.options.baseUrl = BackendConfig.BASE_URL;
    handler.options.connectTimeout = BackendConfig.TIMEOUT;
    handler.options.receiveTimeout = BackendConfig.TIMEOUT;
    handler.options.sendTimeout = BackendConfig.TIMEOUT;
    handler.options.contentType = 'application/json';
  }
}