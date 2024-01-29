import 'package:via_cep/core/dependency_injection/dependency_getit.dart';
import 'package:via_cep/core/rest_client/rest_client.dart';
import 'package:via_cep/model/model_cep.dart';

abstract interface class IRepositoryCEP {
  Future<ModelCEP> getCEP({required String cep});
}

class RepositoryCEPImpl implements IRepositoryCEP {
  final restClient = getIt<IRestClient>();

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
