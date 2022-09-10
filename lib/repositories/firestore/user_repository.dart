import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/models/user.dart';

import '../../utils/firestore_refs.dart';

final userRepositoryProvider = Provider.autoDispose((_) => UserRepository());

class UserRepository {
  Future<User?> fetchUserInfo({
    required String userId,
  }) async {
    final ds = await appUserRef(uid: userId).get();
    return ds.data();
  }

  Future<void> setUserInfo({
    required String uid,
    required String name,
    required String mail,
    String? imageUrl,
  }) async {
    await appUserRef(uid: uid).set(
      User(
        id: uid,
        name: name,
        mail: mail,
        imageUrl: imageUrl,
        createdAt: DateTime.now(), // timestampコンバーターでTimestampに変換される
        updateAt: DateTime.now(), // timestampコンバーターでTimestampに変換される
      ),
      SetOptions(merge: true),
    );
  }
}
