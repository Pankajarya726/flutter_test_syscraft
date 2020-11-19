import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  final BuildContext context;

  GetUserEvent({@required this.context});
}
