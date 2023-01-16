import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;

  final String ranting;
  final String hp;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.hp,
    this.ranting = '',
  });

  @override
  List<Object?> get props => [id, email, name, ranting, hp];
}
