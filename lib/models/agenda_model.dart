import 'package:equatable/equatable.dart';

class AgendaModel extends Equatable {
  final String id;
  final String title;
  final String isi;
  final String tanggal;

  AgendaModel({
    required this.id,
    this.title = '',
    this.isi = '',
    this.tanggal = '',
  });

  factory AgendaModel.fromJson(String id, Map<String, dynamic> json) =>
      AgendaModel(
        id: id,
        title: json['title'],
        isi: json['isi'],
        tanggal: json['tanggal'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isi': isi,
        'tanggal': tanggal,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        isi,
        tanggal,
      ];
}
