import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundtool_app/constants/app_style.dart';
import 'package:fundtool_app/utils/app_helper.dart';
import 'package:fundtool_app/widgets/custome_loadin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/asset_path.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_router.gr.dart';
import '../../widgets/bottom_right_corner.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_phonefield.dart';
import '../../widgets/custom_passwordfiled.dart';
import '../../widgets/fundriser_box.dart';
import '../../widgets/home_screen_card.dart';
import '../../widgets/tab_bar.dart';
import 'bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
    ], child: HomeScreen());
  }
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(
      PerformHomeEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Material(
        type: MaterialType.transparency,
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state.isCompleted) {
                } else if (state.isFailed) {
                  AlertUtils.showSimpleToast(state.errorMsg!);
                }
              },
              builder: (context, state) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageAssetPath.background))),
                    ),
                    Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppStyle.black.withOpacity(0.7),
                      ),
                      child: SafeArea(
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          appBar: AppBar(
                              backgroundColor: Colors.transparent,
                              title: Image.asset(
                                ImageAssetPath.appLogoName,
                                height: 31.h,
                                width: 156.w,
                              ),
                              actions: [
                                SvgPicture.asset(
                                  ImageAssetPath.icNotification,
                                  height: 24.h,
                                  width: 24.h,
                                ),
                              ]),
                          body: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      HomeScreenCard(),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      Container(
                                          height: 72.h,
                                          decoration: BoxDecoration(
                                              color: AppStyle.white,
                                              borderRadius: BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppStyle.fontGray.withOpacity(0.2),
                                                    blurRadius: 13.h,
                                                    spreadRadius: 1)
                                              ]),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: CustomPaint(
                                                painter: BottomRightGradientPainter(LinearGradient(
                                                    begin: Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [AppStyle.gradiant4, AppStyle.gradiant3])),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Create a Fundraiser',
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 22.sp,
                                                                fontWeight: FontWeight.bold,
                                                                color: AppStyle.black),
                                                          ),
                                                          Text(
                                                            'Schedule a fundraiser for your group',
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w300,
                                                                color: AppStyle.fontGray),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 36.h,
                                                        width: 36.h,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(color: AppStyle.gradiant1, width: 3)),
                                                        child: Center(
                                                            child: Icon(
                                                          CupertinoIcons.right_chevron,
                                                          color: AppStyle.appColor,
                                                          size: 19.h,
                                                        )),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          )),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Top Fundraisers',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppStyle.black),
                                          ),
                                          Text(
                                            'View All',
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppStyle.gradiant2),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                      Container(
                                        height: 43.h,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: AppStyle.fontGray.withOpacity(0.5), width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: TabBar(
                                            tabAlignment: TabAlignment.center,
                                            indicatorSize: TabBarIndicatorSize.tab,
                                            dividerHeight: 0,
                                            labelColor: AppStyle.white,
                                            labelStyle: GoogleFonts.poppins(
                                                fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppStyle.white),
                                            unselectedLabelStyle: GoogleFonts.poppins(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppStyle.fontGray.withOpacity(0.7)),
                                            unselectedLabelColor: AppStyle.fontGray.withOpacity(0.7),
                                            padding: EdgeInsets.zero,
                                            indicatorPadding: EdgeInsets.zero,
                                            indicator: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100.0),
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [AppStyle.gradiant4, AppStyle.gradiant3])),
                                            tabs: [
                                              Container(
                                                width: (MediaQuery.of(context).size.width - 120) / 2,
                                                alignment: Alignment.center,
                                                child: Tab(text: 'Created by me'),
                                              ),
                                              Container(
                                                width: (MediaQuery.of(context).size.width - 120) / 2,
                                                alignment: Alignment.center,
                                                child: Tab(text: 'Joined by me'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      if (state.model != null && state.model!.data!.myFund!.isNotEmpty) ...[
                                        ListView.separated(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.symmetric(vertical: 16),
                                            //physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var item = state.model!.data!.myFund![index];
                                              return FundriserBox(
                                                foundName: '${item.fundraiserName}',
                                                goal: '${item.goalAmount}',
                                                currentValue: '${item.earnedAmount}',
                                                image: '${item.logo}',
                                                members: '${item.totalParticipants}',
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height: 11.h,
                                              );
                                            },
                                            itemCount: state.model!.data!.myFund!.length),
                                      ] else ...[
                                        Center(
                                            child: Text(
                                          'No Data Found',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppStyle.black),
                                        )),
                                      ],
                                      if (state.model != null && state.model!.data!.joinedFund!.isNotEmpty) ...[
                                        ListView.separated(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.symmetric(vertical: 16),
                                            //physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var item = state.model!.data!.joinedFund![index];
                                              return FundriserBox(
                                                foundName: '${item.fundraiserName}',
                                                goal: '${item.goalAmount}',
                                                currentValue: '${item.earnedAmount}',
                                                image: '${item.logo}',
                                                members: '${item.totalParticipants}',
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height: 11.h,
                                              );
                                            },
                                            itemCount: state.model!.data!.joinedFund!.length),
                                      ] else ...[
                                        Center(
                                            child: Text(
                                          'No Data Found',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppStyle.black),
                                        )),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (state.isLoading) CustomLoadingScr()
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  void getHomeData() async {}
}
