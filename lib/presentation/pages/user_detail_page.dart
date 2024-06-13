import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_listing_app/domain/repositories/user_repository.dart';
import 'package:user_listing_app/domain/usecases/get_user.dart';
import 'package:user_listing_app/domain/usecases/get_users.dart';

import '../bloc/user_bloc.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: BlocProvider(
        create: (context) => UserBloc(
          getUsers: GetUsers(RepositoryProvider.of<UserRepository>(context)),
          getUser: GetUser(RepositoryProvider.of<UserRepository>(context)),
        )..add(LoadUser(userId: userId)),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              final user = state.user;
              return Center(
                child: Column(
                  children: [
                    Hero(
                      tag: 'avatar_${user.id}',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                        radius: 150,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('${user.firstName} ${user.lastName}',
                        style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 8),
                    Text(user.email, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              );
            } else if (state is UserError) {
              return const Center(child: Text('Failed to load user'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
