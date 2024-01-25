import 'package:flutter/material.dart';
import 'package:via_cep/model/model_cep.dart';

class InfosWidget extends StatelessWidget {
  final ModelCEP? infos;
  const InfosWidget({super.key, required this.infos});

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'CEP: ${infos?.cep ?? ''}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Logradouro: ${infos?.logradouro ?? ''}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Complemento: ${infos?.complemento ?? ''}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Bairro: ${infos?.bairro ?? ''}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Localidade: ${infos?.localidade ?? ''}',
                textAlign: TextAlign.center,
              ),
              Text(
                'UF: ${infos?.uf ?? ''}',
                textAlign: TextAlign.center,
              ),
              Text(
                'DDD: ${infos?.ddd ?? ''}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
