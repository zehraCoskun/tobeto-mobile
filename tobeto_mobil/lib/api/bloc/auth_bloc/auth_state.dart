import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthState {
  const AuthState();
}

@immutable
class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

// LOGIN
@immutable
class AuthStateLoggedIn extends AuthState {
  final User user;

  const AuthStateLoggedIn({
    required this.user,
  });
}

// REGISTER
@immutable
class AuthStateRegistered extends AuthState {
  final User user;

  const AuthStateRegistered({
    required this.user,
  });
}

// RECOVERY
@immutable
class AuthStateRecovered extends AuthState {
  const AuthStateRecovered();
}

// LOGOUT
@immutable
class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}
