import 'package:dio/dio.dart';

abstract class IHttpService {
  Dio get httpDio;
  Future<void> addPackageHeaders();
}