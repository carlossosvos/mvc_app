import 'firestore_model.dart';

class FirebaseUserModel implements FirestoreModel {
  @override
  final String id;
  final String name;
  final int age;

  FirebaseUserModel({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory FirebaseUserModel.fromMap(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return FirebaseUserModel(
      id: documentId,
      name: data['name'],
      age: data['age'],
    );
  }

  String get FirebaseUserModelId => id;
}
