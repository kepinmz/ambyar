import 'package:ambyar_app/models/kegiatan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KegiatanService {
  CollectionReference _kegiatanReference =
      FirebaseFirestore.instance.collection('kegiatans');

  Future<List<KegiatanModel>> fetchKegiatans() async {
    try {
      QuerySnapshot result = await _kegiatanReference.get();
      List<KegiatanModel> kegiatans = result.docs.map(
        (e) {
          return KegiatanModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return kegiatans;
    } catch (e) {
      throw e;
    }
  }
}
