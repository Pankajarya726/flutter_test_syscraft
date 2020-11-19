import 'dart:collection';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/NetworkCheck.dart';
import 'package:fluttertest/users/bloc/user_event.dart';
import 'package:fluttertest/users/bloc/user_state.dart';
import 'package:fluttertest/users/model/get_user_response.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  static UserState get initialState => UserEmptyState();

  UserBloc() : super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserEvent) {
      yield* getUsers(event);
    }
  }

  Stream<UserState> getUsers(GetUserEvent event) async* {
    if (await NetworkCheck.check()) {
      Response response = await Dio().get("https://jsonplaceholder.typicode.com/users");

      if (response.statusCode == 200) {
        Map resultMap = HashMap<String, dynamic>();
        resultMap["user"] = response.data;
        GetUserResponse user = GetUserResponse.fromMap(resultMap);
        log(resultMap.toString());

        yield GetUserSuccessState(userList: user.user);
      } else {
        yield FailureSate(message: response.statusMessage);
      }
    } else {
      yield FailureSate(message: "Please check your internet connection!");
    }
  }
}
