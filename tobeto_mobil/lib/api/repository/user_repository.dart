import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobil/constants/collection_names.dart';

class UserRepository {
  final CollectionReference<Map<String, dynamic>> _collection;

  const UserRepository._private(this._collection);

  static final _instance = UserRepository._private(
    FirebaseFirestore.instance.collection(Collections.USERS),
  );

  factory UserRepository.instance() {
    return _instance;
  }

  Future<void> create(String docId, Map<String, dynamic> data) async {
    await _collection.doc(docId).set(data);
  }

  Future<void> update(String docId, Map<String, dynamic> data) async {
    await _collection.doc(docId).update(data);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String docId) async {
    return await _collection.doc(docId).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> findWithEmail(String email) async {
    return await _collection.where("email", isEqualTo: email).get();
  }
}
