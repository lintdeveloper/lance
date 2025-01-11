import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:lance/shared/services/services.dart';
import 'base_http_service.dart';

class HttpService implements IHttpService {
  late Dio _httpDio;

  String baseUrl;
  final Logger _logger = Logger("HttpService");

  HttpService._(this.baseUrl, {bool addHeaders = true}) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 120000),
      receiveTimeout: const Duration(milliseconds: 300000),
      responseType: ResponseType.json,
      headers: {"Accept": "application/json"},
    );
    _httpDio = Dio(options);
    _httpDio.options = httpDio.options;

    if (kDebugMode) {
      final logInterceptor = LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
        logPrint: (v) => _logger.info(v),
      );
      _httpDio.interceptors.add(logInterceptor);
    }
    if (addHeaders) {
      addPackageHeaders();
      addTokenHeaders();
    }
  }

  factory HttpService(String baseUrl, { bool addHeaders = true}) {
    return HttpService._(baseUrl, addHeaders: addHeaders);
  }

  @override
  Future<void> addPackageHeaders() async {
    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    _httpDio.options.headers["X-App-Package-Name"] = _packageInfo.packageName;
    _httpDio.options.headers["X-App-Version"] = _packageInfo.version;
    _httpDio.options.headers["X-App-Build-Number"] = _packageInfo.buildNumber;
    _httpDio.options.headers["X-App-Build-Signature"] = _packageInfo.buildSignature;
  }

  Future<void> addTokenHeaders() async {
    final secureCacheService = SecureCacheService.instance();
    final token = await secureCacheService.getToken("authToken");
    _httpDio.options.headers["Authorization"] = token["accessToken"];
  }

  @override
  Dio get httpDio => _httpDio;
}