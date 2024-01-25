part of 'cep_cubit.dart';

sealed class CepState extends Equatable {
  final ModelCEP? cep;
  const CepState(this.cep);

  @override
  List<Object> get props => [];
}

final class CepInitial extends CepState {
  const CepInitial(super.cep);
}

final class CepLoading extends CepState {
  const CepLoading(super.cep);
}

final class CepSuccess extends CepState {
  const CepSuccess(super.cep);
}

final class CepError extends CepState {
  final String message;

  const CepError(super.cep, {required this.message});

  @override
  List<Object> get props => [message];
}
