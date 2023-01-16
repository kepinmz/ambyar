import 'package:ambyar_app/models/agenda_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgendaService {
  CollectionReference _agendaReference =
      FirebaseFirestore.instance.collection('agendas');

  Future<List<AgendaModel>> fetchAgendas() async {
    try {
      QuerySnapshot result = await _agendaReference.get();
      List<AgendaModel> agendas = result.docs.map(
        (e) {
          return AgendaModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return agendas;
    } catch (e) {
      throw e;
    }
  }
}
