import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  StorageRepository._private(this._firebaseStorage);

  static final _instance = StorageRepository._private(
    FirebaseStorage.instance,
  );

  factory StorageRepository.instance() {
    return _instance;
  }

  Future<String> putImage(String id, File file) async {
    final result = await _firebaseStorage
        .ref()
        .child("images")
        .child("$id.${file.path.split(".").last}")
        .putFile(file);

    return result.ref.getDownloadURL();
  }

  Future<String> updateImage(String id, File file, String url) async {
    await deleteFile(url);

    return await putImage(id, file);
  }

  Future<Reference> putFile(String id, File file) async {
    final result = await _firebaseStorage
        .ref()
        .child("certificates")
        .child(id)
        .child(file.uri.pathSegments.last)
        .putFile(file);

    return result.ref;
  }

  Future<void> deleteFile(String url) async {
    await _firebaseStorage.refFromURL(url).delete();
  }

  Future<String?> getFile(String url) async {
    return await _firebaseStorage.refFromURL(url).getDownloadURL();
  }

  Future<List<Reference>> getImages() {
    return _firebaseStorage
        .ref()
        .child("teams")
        .list()
        .then((value) => value.items);
  }

  Reference getFileReference(String url) {
    return _firebaseStorage.refFromURL(url);
  }
}
