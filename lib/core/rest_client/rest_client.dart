import 'package:dio/dio.dart';

abstract interface class IRestClient {
  Future<dynamic> getCEP({required String url});
}

class DioRestClientImpl implements IRestClient {
  final client = Dio();
  @override
  Future<dynamic> getCEP({required String url}) async {
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Erro ao buscar CEP: ${response.statusCode}');
      }
    } on DioException {
      throw Exception();
    }
  }
}
