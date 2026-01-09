import 'package:dio/dio.dart';

class DioHelper {
  static const _baseUrl = 'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/';
  static final _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<CustomResponse> getData({String pass = ''}) async {
    try {
      final resp = await _dio.get(pass);

      final data;
      if (resp.data is List) {
        data = {"list": resp.data};
      } else {
        data = resp.data;
      }

      return CustomResponse(mag: 'is Success', isSuccess: true, data: data);
    } on DioException catch (ex) {
      return CustomResponse(
        isSuccess: false,
        mag: ex.response!.data['message'],
      );
    }
  }

  static Future<CustomResponse> sendData({
    String pass = '',
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await _dio.post(pass, data: data);
      print(resp.data);
      return CustomResponse(isSuccess: true, mag: 'is Success');
    } on DioException catch (ex) {
      return CustomResponse(
        isSuccess: false,
        mag: ex.response!.data['message'],
      );
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final String? mag;
  final Map<String, dynamic>? data;

  CustomResponse({required this.isSuccess, required this.mag, this.data});
}
