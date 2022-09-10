import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/models/user.dart';

import '../../utils/firestore_refs.dart';

final userRepositoryProvider = Provider.autoDispose((_) => UserRepository());

class UserRepository {
  Future<void> setUserInfo({
    required String userId,
    required String uid,
    required String name,
    required String mail,
    String? imageUrl,
  }) async {
    await appUserRef(userId: userId).set(
      User(
        id: uid,
        name: name,
        mail: mail,
        imageUrl: imageUrl,
      ),
      SetOptions(merge: true),
    );
  }
}
