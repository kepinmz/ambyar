import 'package:equatable/equatable.dart';

class KegiatanModel extends Equatable {
  final String id;
  final String title;
  final String isi;
  final String tanggal;
  final String imageUrl;

  KegiatanModel({
    required this.id,
    this.title = '',
    this.isi = '',
    this.tanggal = '',
    this.imageUrl = '',
  });

  factory KegiatanModel.fromJson(String id, Map<String, dynamic> json) =>
      KegiatanModel(
        id: id,
        title: json['title'],
        isi: json['isi'],
        tanggal: json['tanggal'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isi': isi,
        'imageUrl': imageUrl,
        'tanggal': tanggal,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        isi,
        imageUrl,
        tanggal,
      ];
}
