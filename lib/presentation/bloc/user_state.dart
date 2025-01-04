import 'package:flutter_app_test/domain/models/users_posts.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UsersPosts> data; // Aquí puedes usar cualquier tipo de datos
  UserLoaded(this.data);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
