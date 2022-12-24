import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controllers/Repositories/story_repo.dart';
import 'package:productbox_flutter_exercise/Models/story_model.dart';
import 'package:productbox_flutter_exercise/Views/SocketsScreen/sockets_screen.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/status_bar_configuration.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Views/Utils/PageTransitions/slide_page_transition.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<DashboardScreen> {
  List<StoryModel> newList = [];

  @override
  void initState() {
    newList = StoryRepo.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: AppColors.white,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 120.sp),

              //stories
              Container(
                height: 200.sp,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: newList.length,
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      StoryModel model = newList[index];
                      return Container(
                        margin: EdgeInsets.only(left: 30.sp),
                        color: AppColors.white,
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 100.r,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 90.r,
                            backgroundImage:
                                AssetImage(model.profileImage.toString()),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20.sp),

              //posts
              Container(
                height: 1.sh,
                width: 1.sw,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: newList.length,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 400.sp),
                    itemBuilder: (context, index) {
                      StoryModel newModel = newList[index];
                      return Container(
                        height: 900.sp,
                        width: 1.sw,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 40.sp,
                                bottom: 20.sp,
                              ),
                              height: 100.sp,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                      radius: 100.r,
                                      backgroundColor: AppColors.primaryColor,
                                      backgroundImage: AssetImage(
                                          newModel.profileImage.toString()),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 100.sp,
                                      color: AppColors.white,
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        child: Text(
                                          newModel.userName.toString(),
                                          style: postTitleStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CustomSlidePageRoute(
                                      child: const SocketsScreen(),
                                      direction: AxisDirection.down,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  newModel.feedImage!,
                                  // 'assets/images/laptop7.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
