import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/core/rest_client/rest_client.dart';

import 'package:via_cep/core/theme/theme.dart';
import 'package:via_cep/pages/cubit/cep_cubit.dart';
import 'package:via_cep/pages/home_page.dart';
import 'package:via_cep/repositories/repository_cep.dart';
import 'package:via_cep/services/service_cep.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.themeDefault,
      home: BlocProvider(
        create: (context) => CepCubit(
          serviceCEP: ServiceCEPImpl(
            repositoryCEP: RepositoryCEPImpl(
              restClient: DioRestClientImpl(),
            ),
          ),
        ),
        child: const HomePage(),
      ),
    );
  }
}
