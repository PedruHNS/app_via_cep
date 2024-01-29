import 'package:via_cep/core/dependency_injection/dependency_getit.dart';
import 'package:via_cep/model/model_cep.dart';
import 'package:via_cep/repositories/repository_cep.dart';

abstract interface class ServiceCEP {
  Future<ModelCEP> getCEP({required String cep});
}

class ServiceCEPImpl implements ServiceCEP {
  final repositoryCEP = getIt<IRepositoryCEP>();

  @override
  Future<ModelCEP> getCEP({required String cep}) async =>
      await repositoryCEP.getCEP(cep: cep);
}
