import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/firebase_options.dart';

final _authProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final _googleSignInProvider = Provider<GoogleSignIn>(
  (_) => GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId),
);

final signInGoogleProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      final signInAccount = await ref.read(_googleSignInProvider).signIn();
      if (signInAccount == null) {
        return;
      }
      final auth = await signInAccount.authentication;

      final userCredential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      await ref.read(_authProvider).signInWithCredential(userCredential);
    } catch (e) {
      print(e);
    }
  },
);
