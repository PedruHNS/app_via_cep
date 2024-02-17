import 'package:via_cep/core/rest_client/rest_client.dart';
import 'package:via_cep/model/model_cep.dart';

abstract interface class IRepositoryCEP {
  Future<ModelCEP> getCEP({required String cep});
}

class RepositoryCEPImpl implements IRepositoryCEP {
  final IRestClient restClient;

  RepositoryCEPImpl({required this.restClient});

  @override
  Future<ModelCEP> getCEP({required String cep}) async {
    try {
      final url = 'https://viacep.com.br/ws/$cep/json/';

      final response = await restClient.getCEP(url: url);

      final infoCEP = ModelCEP.fromMap(response);

      return infoCEP;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
