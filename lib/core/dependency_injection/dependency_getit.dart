import 'package:get_it/get_it.dart';
import 'package:via_cep/core/rest_client/rest_client.dart';
import 'package:via_cep/pages/cubit/cep_cubit.dart';
import 'package:via_cep/repositories/repository_cep.dart';
import 'package:via_cep/services/service_cep.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<IRestClient>(() => DioRestClientImpl());
  getIt.registerLazySingleton<IRepositoryCEP>(
      () => RepositoryCEPImpl(restClient: getIt<IRestClient>()));
  getIt.registerLazySingleton<ServiceCEP>(
      () => ServiceCEPImpl(repositoryCEP: getIt<IRepositoryCEP>()));
  getIt.registerFactory<CepCubit>(
      () => CepCubit(serviceCEP: getIt<ServiceCEP>()));
}
