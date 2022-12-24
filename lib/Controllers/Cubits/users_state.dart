part of 'users_cubit.dart';

//other States can be 'Token Expire', 'Session End', etc we can define
//as many as state we want then we need to handle all in the widget tree using builder

@immutable
abstract class UsersState {}

//inital state
class UsersInitial extends UsersState {}

//while data is loading and builder is waiting for the data
class UsersLoading extends UsersState {}

//for success case
class UsersSuccess extends UsersState {}

//if internet connection is down
class UsersNoInternet extends UsersState {}

//if the response list id empty
class UsersEmpty extends UsersState {}

class UsersUnAuthorized extends UsersState {}

//if there is some error
class UsersError extends UsersState {
  //we can get the response text and assign here for showing user if any error
  final String? errorMessage;

  UsersError(this.errorMessage);
}
