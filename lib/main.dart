import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Views/AuthenticationScreen/login_screen.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //I am switching off the landscape mode here because landscape mode is not demanded
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //these are my real device resolution values you set the design values provided
      //in the design file here and work
      designSize: const Size(1080, 2340),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          //list of providers are separated because that make code difficult to read
          providers: mainCubitProvidersList,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            //the named routes are good and I can use that too but as it is a choice I will prefer normal navigation
            //here we have to list all the registered routes, the routes are named on top of each screen
            routes: {},
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
