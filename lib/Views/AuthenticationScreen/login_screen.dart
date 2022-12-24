import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/users_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/app_controllers.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/status_bar_configuration.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/utils.dart';
import 'package:productbox_flutter_exercise/Views/Utils/CustomWidgets/LoginCustomWidgets/custom_text_field.dart';
import 'package:productbox_flutter_exercise/Views/Utils/CustomWidgets/LoginCustomWidgets/login_button.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Shapes/bottom_left_design.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Shapes/login_page_bottom_design.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Shapes/login_page_top_big_design.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Shapes/login_page_top_small_design.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? lastTimeButtonPressed;
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);
        final isWarning = lastTimeButtonPressed == null ||
            now.difference(lastTimeButtonPressed!) > maxDuration;

        if (isWarning) {
          lastTimeButtonPressed = DateTime.now();
          final snackBar = Utils.showSnackBar(
            context: context,
            message: AppStrings.exit,
          );
          return false;
        } else {
          return true;
        }
      },
      child: StatusBarConfiguration.statusBarConfiguration(
        child: Scaffold(
          body: Container(
            height:
                1.sh, //MediaQuery.of(context).size.height [sp: system height]
            width: 1.sw, //MediaQuery.of(context).size.width [sw: system width]
            color: AppColors.backgroundColor,
            child: Stack(
              children: [
                //top large design
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomPaint(
                    size: Size(1.sw / 0.61, 1.sh / 1.6),
                    painter: LoginPageTopBigDesign(),
                  ),
                ),

                //top small deign
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomPaint(
                    size: Size(1.sw / 0.75, 1.sh / 1.6),
                    painter: LoginPageTopSmallDesign(),
                  ),
                ),

                //bottom right side design
                Positioned(
                  bottom: -70.sp,
                  right: 0,
                  child: CustomPaint(
                    size: Size(1.sw / 1.1, 1.sh / 3),
                    painter: BottomRightDesign(),
                  ),
                ),

                //bottom left side design
                Positioned(
                  bottom: -140.sp,
                  left: 0,
                  child: CustomPaint(
                    size: Size(1.sw / 0.65, 1.sh / 1.8),
                    painter: BottomLeftDesign(),
                  ),
                ),

                //actual page content
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    color: Colors.transparent,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        vertical: 1.sh / 3.3,
                        horizontal: 100.sp,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //login text
                        Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              AppStrings.login,
                              style: styleOne,
                            ),
                          ),
                        ),
                        SizedBox(height: 100.sp),

                        //username textField
                        CustomTextField(
                          controller: AppControllers.userNameController,
                          hintText: AppStrings.loginFirstTextFieldText,
                        ),
                        SizedBox(height: 50.sp),

                        //password textField
                        CustomTextField(
                          controller: AppControllers.passwordController,
                          hintText: AppStrings.loginSecondTextFieldText,
                        ),
                        SizedBox(height: 50.sp),

                        //loginButton
                        LoginButton(
                          title: AppStrings.buttonLog,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () => context
                              .read<UsersCubit>()
                              .fetchUsersList(context: context),
                        ),
                        SizedBox(height: 50.sp),

                        //forget password text
                        Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              AppStrings.forgetPass,
                              style: styleTwo,
                            ),
                          ),
                        ),
                        SizedBox(height: 150.sp),

                        //register here text
                        Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              AppStrings.register,
                              style: styleThree,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
