import 'package:ambyar_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'ranting': user.ranting,
        'hp': user.hp,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        name: snapshot['name'],
        email: snapshot['email'],
        ranting: snapshot['ranting'],
        hp: snapshot['hp'],
      );
    } catch (e) {
      throw e;
    }
  }
}
