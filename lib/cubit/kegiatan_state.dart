part of 'kegiatan_cubit.dart';

abstract class KegiatanState extends Equatable {
  const KegiatanState();

  @override
  List<Object> get props => [];
}

class KegiatanInitial extends KegiatanState {}

class KegiatanLoading extends KegiatanState {}

class KegiatanSuccess extends KegiatanState {
  final List<KegiatanModel> kegiatans;

  KegiatanSuccess(this.kegiatans);

  @override
  List<Object> get props => [kegiatans];
}

class KegiatanFailed extends KegiatanState {
  final String error;

  KegiatanFailed(this.error);

  @override
  List<Object> get props => [error];
}
