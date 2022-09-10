import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenly_like_app/models/user.dart';

final db = FirebaseFirestore.instance;

final userRef = db.collection('users').withConverter(
      fromFirestore: (ds, _) => User.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Userドキュメントの参照
DocumentReference<User> appUserRef({
  required String uid,
}) =>
    userRef.doc(uid);
