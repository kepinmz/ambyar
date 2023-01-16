import 'package:ambyar_app/models/kegiatan_model.dart';
import 'package:ambyar_app/services/kegiatan_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'kegiatan_state.dart';

class KegiatanCubit extends Cubit<KegiatanState> {
  KegiatanCubit() : super(KegiatanInitial());

  void fetchKegiatans() async {
    try {
      emit(KegiatanLoading());

      List<KegiatanModel> kegiatans = await KegiatanService().fetchKegiatans();

      emit(KegiatanSuccess(kegiatans));
    } catch (e) {
      emit(KegiatanFailed(e.toString()));
    }
  }
}
