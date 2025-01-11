import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lance/shared/services/httpService/http_service.dart';

import 'base_api_service.dart';

//TODO: @Injectable(as: IApiService)
class ApiService implements IApiService {
  late HttpService httpService;

  ApiService(this.httpService);

  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    final response = await httpService.httpDio.get(url,
        queryParameters: queryParams, options: Options(headers: headers));
    return response.data;
  }

  @override
  Future<List> getList(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    final response = await httpService.httpDio.get(url,
        queryParameters: queryParams, options: Options(headers: headers));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> patch(String url,
      {Map<String, dynamic>? headers, Map? body, encoding}) async {
    final response = await httpService.httpDio.patch(url,
        data: body == null ? null : json.encode(body),
        options: Options(headers: headers));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(String url,
      {Map<String, dynamic>? headers,
      Map? body,
      Map<String, dynamic>? queryParams,
      encoding}) async {
    //print("POST");
    //print(json.encode(body));
    //print(url);
    //print(queryParams);
    final response = await httpService.httpDio.post(url,
        data: json.encode(body),
        queryParameters: queryParams,
        options: Options(headers: headers));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(String url,
      {Map<String, dynamic>? headers,
      Map? body,
      Map<String, dynamic>? queryParams,
      encoding}) async {
    final data = body != null ? json.encode(body) : null;
    final response = await httpService.httpDio.put(url,
        data: data,
        queryParameters: queryParams,
        options: Options(headers: headers));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> delete(String url,
      {Map<String, dynamic>? headers,
       Map? body,
      Map<String, dynamic>? queryParams}) async {
    final data = body != null ? json.encode(body) : null;
    final response = await httpService.httpDio.delete(url,
        queryParameters: queryParams,data: data, options: Options(headers: headers));
    return response.data;
  }
  
  @override
  Future<Map<String, dynamic>> upload(String url, {Map<String, dynamic>? headers, Map? body, encoding}) async{
      final formData = FormData.fromMap(body as Map<String, dynamic>);
      final response = await httpService.httpDio.post(url, data:formData, options: Options(headers: headers));
    return response.data;
  }
}
