// ignore_for_file: public_member_api_docs, sort_constructors_first

class ModelCEP {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  ModelCEP({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  // factory ModelCEP.fromJson(Map<String, dynamic> json) {
  //   return ModelCep(
  //     cep: json['cep'] ?? '',
  //     logradouro: json['logradouro'] ?? '',
  //     complemento: json['complemento'] ?? '',
  //     bairro: json['bairro'] ?? '',
  //     localidade: json['localidade'] ?? '' ,
  //     uf: json['uf'] ?? '',
  //     ddd: json['ddd'] ?? '',
  //   );
  // }
//!mesma coisa que o de cima
  factory ModelCEP.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'cep': final String cep,
        'logradouro': final String logradouro,
        'complemento': final String complemento,
        'bairro': final String bairro,
        'localidade': final String localidade,
        'uf': final String uf,
        'ddd': final String ddd,
      } =>
        ModelCEP(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
          ddd: ddd,
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }
}
