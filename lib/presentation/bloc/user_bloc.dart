import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_listing_app/domain/usecases/get_user.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  final GetUser getUser;

  UserBloc({required this.getUsers, required this.getUser})
      : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      try {
        final users = await getUsers(event.page);
        emit(UsersLoaded(users: users));
      } catch (_) {
        emit(UserError());
      }
    });

    on<LoadUser>((event, emit) async {
      try {
        final user = await getUser(event.userId);
        emit(UserLoaded(user: user));
      } catch (_) {
        emit(UserError());
      }
    });
  }
}
