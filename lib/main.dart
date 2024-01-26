import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/core/dependency_injection/dependency_getit.dart';

import 'package:via_cep/core/theme/theme.dart';
import 'package:via_cep/pages/cubit/cep_cubit.dart';
import 'package:via_cep/pages/home_page.dart';

void main() {
  setup();
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
        create: (context) => getIt<CepCubit>(),
        child: const HomePage(),
      ),
    );
  }
}
