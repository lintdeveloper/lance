import 'package:dio/dio.dart';

abstract class IApiService {
  Future<Map> get(String url, {Map<String, dynamic>? headers});
  Future<List> getList(String url, {Map<String, dynamic>? headers});
  Future<Map> post(String url, {Map<String, dynamic>? headers, Map body, encoding});
  Future<Map> upload(String url, {Map<String, dynamic>? headers, Map body, encoding});
  Future<Map> delete(String url, {Map<String, dynamic>? headers});
  Future<Map> put(String url, {Map<String, dynamic>? headers, Map body, encoding});
  Future<Map> patch(String url, {Map<String, dynamic>? headers, Map body, encoding});
}