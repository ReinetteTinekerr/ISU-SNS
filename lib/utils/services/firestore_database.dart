import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university_chat_app/domain/models/user.dart';

class FirestoreDatabase {
  final _service = FirebaseFirestore.instance;

  void addUser(User user) {
    final moviesRef = _service.collection('users').withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }
}
