import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InternetFailure extends Failure {}

class FailureMessage {
  static String server = 'Error server';
  static String unexpected = 'Unexpected Error';
  static String internet = 'Lost internet connexion :(';
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case InternetFailure:
      return FailureMessage.internet;
    case ServerFailure:
      return FailureMessage.server;
    default:
      return FailureMessage.unexpected;
  }
}
