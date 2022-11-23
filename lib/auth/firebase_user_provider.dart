import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Video4AppFirebaseUser {
  Video4AppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Video4AppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Video4AppFirebaseUser> video4AppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Video4AppFirebaseUser>(
      (user) {
        currentUser = Video4AppFirebaseUser(user);
        return currentUser!;
      },
    );
