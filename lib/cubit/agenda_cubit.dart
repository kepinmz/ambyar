import 'package:ambyar_app/models/agenda_model.dart';
import 'package:ambyar_app/services/agenda_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  AgendaCubit() : super(AgendaInitial());

  void fetchAgendas() async {
    try {
      emit(AgendaLoading());

      List<AgendaModel> agendas = await AgendaService().fetchAgendas();

      emit(AgendaSuccess(agendas));
    } catch (e) {
      emit(AgendaFailed(e.toString()));
    }
  }
}
