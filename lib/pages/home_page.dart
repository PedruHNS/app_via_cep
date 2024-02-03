import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/core/dependency_injection/dependency_getit.dart';
import 'package:via_cep/pages/cubit/cep_cubit.dart';
import 'package:via_cep/pages/infos_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cepController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (value.length < 8 || value.length > 8) {
      return 'CEP inválido';
    } else if (int.tryParse(value) == null) {
      return 'CEP inválido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIA CEP'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    validator: validator,
                    controller: _cepController,
                    keyboardType: TextInputType.number,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: const InputDecoration(
                      hintText: 'Digite o CEP',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: mediaQuery.size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        getIt<CepCubit>().fetchCEP(cep: _cepController.text);
                      }
                    },
                    child: const Text('Buscar'),
                  ),
                ),
                BlocBuilder<CepCubit, CepState>(
                  builder: (context, state) {
                    return switch (state) {
                      CepInitial() => const SizedBox(),
                      CepSuccess() => Container(
                          padding: const EdgeInsets.all(12),
                          width: mediaQuery.size.width,
                          child: InfosWidget(infos: state.cep)),
                      CepLoading() => CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary),
                      CepError() => const Center(
                          child: Text('erro no cep'),
                        )
                    };
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
