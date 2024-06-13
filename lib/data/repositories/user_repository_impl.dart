import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final String baseUrl = "https://reqres.in/api/users";

  @override
  Future<List<User>> getUsers(int page) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List)
          .map((user) => UserModel.fromJson(user).toDomain())
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/$userId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data['data']).toDomain();
    } else {
      throw Exception('Failed to load user');
    }
  }
}
