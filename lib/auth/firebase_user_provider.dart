import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PrototypeFirebaseUser {
  PrototypeFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PrototypeFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PrototypeFirebaseUser> prototypeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PrototypeFirebaseUser>(
      (user) {
        currentUser = PrototypeFirebaseUser(user);
        return currentUser!;
      },
    );
