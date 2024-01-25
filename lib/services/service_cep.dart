import 'package:via_cep/model/model_cep.dart';
import 'package:via_cep/repositories/repository_cep.dart';

abstract interface class ServiceCEP {
  Future<ModelCEP> getCEP({required String cep});
}

class ServiceCEPImpl implements ServiceCEP {
  final IRepositoryCEP repositoryCEP;

  ServiceCEPImpl({required this.repositoryCEP});
  @override
  Future<ModelCEP> getCEP({required String cep}) async {
    try {
      final infoCEP = await repositoryCEP.getCEP(cep: cep);
      return infoCEP;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
