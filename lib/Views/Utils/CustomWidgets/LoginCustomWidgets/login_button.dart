import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/users_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/app_controllers.dart';
import 'package:productbox_flutter_exercise/Views/DocumentsScreen/document_upload_screen.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/utils.dart';
import 'package:productbox_flutter_exercise/Views/Utils/PageTransitions/slide_page_transition.dart';

class LoginButton extends StatelessWidget {
  final String? title;
  final Color? buttonColor;
  final void Function()? onPressed;

  const LoginButton({
    Key? key,
    required this.title,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: 160.sp,
        width: 1.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor!,
          borderRadius: BorderRadius.circular(100.sp),
        ),
        child: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, loginState) {
            if (loginState is UsersUnAuthorized) {
              Utils.showSnackBar(
                context: context,
                message: AppStrings.unauthorized,
              );
            } else if (loginState is UsersError) {
              Utils.showSnackBar(
                context: context,
                message: AppStrings.fail,
              );
            } else if (loginState is UsersSuccess) {
              //show snack bar
              Utils.showSnackBar(
                context: context,
                message: AppStrings.success,
              );

              //clear the field
              AppControllers.userNameController.clear();
              AppControllers.passwordController.clear();

              //here pushReplacement is used normally for current time
              //we are not managing auto login of user therefore I have used simple push
              //we can auto_login the user by storing an int or bool value at shared_preferences
              //Navigate
              Navigator.push(
                context,
                CustomSlidePageRoute(
                  child: const DocumentUploadScreen(),
                  direction: AxisDirection.left,
                ),
              );
            }
          },
          builder: (context, loginState) {
            //[Note: We can customize different widgets for different states
            //and use them here, by that the we can maintain a clean and readable
            //code, here I have not created any for achieving the final goal sooner
            if (loginState is UsersLoading) {
              return CircularProgressIndicator(color: AppColors.white);
            } else if (loginState is UsersInitial ||
                loginState is UsersSuccess ||
                loginState is UsersError ||
                loginState is UsersNoInternet ||
                loginState is UsersUnAuthorized) {
              return Text(
                title!,
                style: styleFour,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
