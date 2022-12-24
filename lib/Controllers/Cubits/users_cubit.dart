import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/Controllers/Repositories/users_repository.dart';
import 'package:productbox_flutter_exercise/Controllers/app_controllers.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/utils.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  ///users data function
  fetchUsersList({required BuildContext context}) async {
    final String userName = AppControllers.userNameController.text.trim();
    final String password = AppControllers.passwordController.text.trim();

    if (userName.isEmpty || password.isEmpty) {
      Utils.showSnackBar(
        context: context,
        message: AppStrings.invalidCredentials,
      );
    } else {
      try {
        emit(UsersLoading());
        final apiStatus = await UsersRepository.usersData(
          userName: userName,
          password: password,
        );

        if (apiStatus == 200) {
          emit(UsersSuccess());
        } else if (apiStatus == 30) {
          emit(UsersEmpty());
        } else if (apiStatus == 401) {
          emit(UsersUnAuthorized());
        } else if (apiStatus == 20) {
          emit(UsersNoInternet());
        } else {
          emit(UsersError('Something went wrong while fetching data'));
        }
      } on Exception catch (e) {
        emit(UsersError('Something went wrong while fetching data'));
      }
    }
  }
}
