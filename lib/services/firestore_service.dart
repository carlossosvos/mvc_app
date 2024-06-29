import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/firestore_model.dart';

class FirestoreService<T extends FirestoreModel> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collectionPath;
  final T Function(Map<String, dynamic>, String) fromMap;

  FirestoreService({
    required this.collectionPath,
    required this.fromMap,
  });

  Future<void> addItem(T item) {
    return _db.collection(collectionPath).doc(item.id).set(item.toMap());
  }

  Future<void> updateItem(T item) {
    return _db.collection(collectionPath).doc(item.id).update(item.toMap());
  }

  Future<void> deleteItem(String id) {
    return _db.collection(collectionPath).doc(id).delete();
  }

  Stream<List<T>> getItems() {
    return _db.collection(collectionPath).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => fromMap(doc.data()!, doc.id)).toList());
  }
}
