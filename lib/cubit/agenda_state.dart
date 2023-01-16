part of 'agenda_cubit.dart';

abstract class AgendaState extends Equatable {
  const AgendaState();

  @override
  List<Object> get props => [];
}

class AgendaInitial extends AgendaState {}

class AgendaLoading extends AgendaState {}

class AgendaSuccess extends AgendaState {
  final List<AgendaModel> agendas;

  AgendaSuccess(this.agendas);

  @override
  List<Object> get props => [agendas];
}

class AgendaFailed extends AgendaState {
  final String error;

  AgendaFailed(this.error);

  @override
  List<Object> get props => [error];
}
