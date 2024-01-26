import 'package:cloud_firestore/cloud_firestore.dart';

class Failure {
  final String? code;
  final String message;

  const Failure({
    required this.code,
    required this.message,
  });

  factory Failure.fromFirebaseException(FirebaseException e) {
    return Failure(code: e.code, message: e.message ?? 'An error occured');
  }

  factory Failure.fromErr(Object e) {
    return Failure(code: null, message: e.toString());
  }
}
