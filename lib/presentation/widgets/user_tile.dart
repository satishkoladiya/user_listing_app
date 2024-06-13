import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: 'avatar_${user.id}',
        child: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: () {
        Navigator.pushNamed(context, '/user', arguments: user.id);
      },
    );
  }
}
