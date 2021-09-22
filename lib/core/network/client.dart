// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:try_starter/env/config.dart';

class Client {
  Client({required this.config});
  late Config config;

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
        baseUrl: config.apiBaseUrl!,
        connectTimeout: 20000,
        receiveTimeout: 30000,
        receiveDataWhenStatusError: true,
        headers: <String, dynamic>{'isToken': 'ghjklkwuio'});

    final dio = Dio(options);

    dio.interceptors.addAll(<Interceptor>[_loginInterceptor()]);

    return dio;
  }

  Interceptor _loginInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        print("--> ${options.method}  ${"${options.baseUrl}${options.path}"}");
        print('Headers:');
        options.headers.forEach((k, dynamic v) => print('$k: $v'));
        print('queryParameters:');
        options.queryParameters.forEach((k, dynamic v) => print('$k: $v'));
        print(
          '--> END ${options.method}',
        );

        if (options.headers.containsKey('isToken')) {
          options.headers.remove('isToken');
          // options.headers.addAll({'Authorization': 'Bearer $storageToken'});
        }

        // Do something before request is sent
        debugPrint('\n'
            '-- headers --\n'
            '${options.headers.toString()} \n'
            '-- request --\n -->body'
            '${options.data} \n'
            '');

        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can return a `Response` object or return `dio.resolve(data)`.
        // If you want to reject the request with a error message,
        // you can return a `DioError` object or return `dio.reject(errMsg)`
      },
      onResponse: (response, handler) {
        // Do something with response data
        debugPrint('\n'
            'Response : ${response.requestOptions.uri} \n'
            '-- headers --\n'
            '${response.headers.toString()} \n'
            '-- response --\n'
            '${jsonEncode(response.data)} \n'
            '');

        return handler.next(response); // continue
      },
      onError: (e, handler) {
        return handler.next(e);
      },
    );
  }
}
