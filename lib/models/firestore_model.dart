abstract class FirestoreModel {
  String get id;

  Map<String, dynamic> toMap();

  static FirestoreModel fromMap(Map<String, dynamic> map, String id) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }
}
