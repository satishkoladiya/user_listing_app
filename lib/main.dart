import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/user_repository_impl.dart'; // Import the implementation
import 'domain/repositories/user_repository.dart'; // Import the interface
import 'domain/usecases/get_user.dart';
import 'domain/usecases/get_users.dart';
import 'presentation/bloc/user_bloc.dart';
import 'presentation/pages/user_detail_page.dart';
import 'presentation/pages/user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              getUsers:
                  GetUsers(RepositoryProvider.of<UserRepository>(context)),
              getUser: GetUser(RepositoryProvider.of<UserRepository>(context)),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'User Listing App',
          theme: ThemeData(
            fontFamily: 'SF-Pro',
          ),
          routes: {
            '/': (context) => UserListPage(),
            '/user': (context) => UserDetailPage(
                userId: ModalRoute.of(context)!.settings.arguments as int),
          },
        ),
      ),
    );
  }
}
