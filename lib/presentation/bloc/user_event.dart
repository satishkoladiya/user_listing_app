part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {
  final int page;

  LoadUsers({required this.page});

  @override
  List<Object> get props => [page];
}

class LoadUser extends UserEvent {
  final int userId;

  LoadUser({required this.userId});

  @override
  List<Object> get props => [userId];
}
