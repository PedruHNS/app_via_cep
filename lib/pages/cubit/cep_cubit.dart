import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:via_cep/model/model_cep.dart';
import 'package:via_cep/services/service_cep.dart';

part 'cep_state.dart';

class CepCubit extends Cubit<CepState> {
  final ServiceCEP serviceCEP;
  CepCubit(this.serviceCEP) : super(const CepInitial(null));

  Future<void> fetchCEP({required String cep}) async {
    emit(const CepInitial(null));
    try {
      emit(const CepLoading(null));
      final infoCEP = await serviceCEP.getCEP(cep: cep);
      emit(CepSuccess(infoCEP));
    } on Exception catch (e) {
      emit(CepError(null, message: e.toString()));
    }
  }
}
