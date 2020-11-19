import 'package:equatable/equatable.dart';
import 'package:fluttertest/users/model/get_user_response.dart';
import 'package:meta/meta.dart';

abstract class UserState extends Equatable {}

class UserEmptyState extends UserState {
  @override
  List<Object> get props => [];
}

class GetUserSuccessState extends UserState {
  final List<User> userList;

  GetUserSuccessState({@required this.userList});

  @override
  List<Object> get props => [userList];
}

class FailureSate extends UserState {
  final String message;

  FailureSate({@required this.message});

  @override
  List<Object> get props => [message];
}
