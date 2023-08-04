import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/screens/edit_profile_screen.dart';
import 'package:rob_flour_pasta_app/screens/favorite_screen.dart';
import 'package:rob_flour_pasta_app/screens/login_screen.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/home_screen.dart';
import 'package:rob_flour_pasta_app/screens/order_screens/order_screen.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  late PageController pageController;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(keepPage: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    // this will act as a link between tab bar and the pageView widget in the scaffold body.
    pageController.jumpToPage(page);
  }

  // void navigateToAddClientForm() {
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) =>  AddClientForm(
  //         formType: "Add Client Form",
  //       )));
  // }

  // void navigateToAddInvoiceForm() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => AddInvoiceForm()));
  // }

  // void navigateToAddEstimateForm() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => AddEstimateForm()));
  // }

  // void openDrawer(BuildContext context) {
  //   Scaffold.of(context).openDrawer();
  // }

  @override
  Widget build(BuildContext context) {
    var mainScreenItems = [
      HomeScreen(),
      FavoriteScreen(),
      OrderScreen(),
      LoginScreen(),
      EditProfileScreen(),
    ];

    return GestureDetector(
      onTap: () {
        setState(() {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen = false;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(0),
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white, // added
          // border: Border.all(color: Colors.orange, width: 5), // added
          borderRadius: BorderRadius.circular(isDrawerOpen ? 25.0 : 0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Visibility(
                      visible: _page == 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print("tapped");
                                    if (isDrawerOpen == true) {
                                      xOffset = 0;
                                      yOffset = 0;
                                      scaleFactor = 1;
                                      isDrawerOpen = false;
                                    } else {
                                      isDrawerOpen = true;

                                      xOffset = 300.w;
                                      yOffset = 100.h;
                                      scaleFactor = 0.8;
                                    }
                                  });
                                },
                                child: SvgPicture.asset(
                                  "assets/hamburger.svg",
                                  height: 20.h,
                                )),
                            SizedBox(
                              width: 10.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(EditProfileScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: greenColor),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80")),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(EditProfileScreen());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: "Rayan deck",
                                    size: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  BigText(
                                    text: "Rayan deck04@gmail.com",
                                    size: 14.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Row(
                              children: [
                                SvgPicture.asset("assets/message.svg"),
                                SizedBox(
                                  width: 16.w,
                                ),
                                SvgPicture.asset("assets/call.svg"),
                                SizedBox(
                                  width: 16.w,
                                ),
                                SvgPicture.asset("assets/cart_icon.svg"),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: onPageChanged,
                        children: mainScreenItems,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              bottomNavigationBar: CupertinoTabBar(
                currentIndex: _page,
                backgroundColor: Colors.white,
                // inactiveColor: progressBackgroundColor,
                // activeColor: blueColor,
                items: [
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _page == 0
                            ? BigText(
                                text: ".",
                                color: redColor,
                              )
                            : SizedBox(
                                height: 16.h,
                              ),
                        _page == 0
                            ? BigText(
                                text: "Home",
                                color: redColor,
                                size: 14.sp,
                              )
                            : SvgPicture.asset(
                                "assets/home.svg",
                                // width: 30,
                                // color: _page == 0 ? blueColor : progressBackgroundColor,
                              )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _page == 1
                            ? BigText(
                                text: ".",
                                color: redColor,
                              )
                            : SizedBox(
                                height: 16.h,
                              ),
                        _page == 1
                            ? BigText(
                                text: "Favorite",
                                color: redColor,
                                size: 14.sp,
                              )
                            : SvgPicture.asset(
                                "assets/fav.svg",
                                // width: 30,
                                // color: _page == 0 ? blueColor : progressBackgroundColor,
                              )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _page == 2
                            ? BigText(
                                text: ".",
                                color: redColor,
                              )
                            : SizedBox(
                                height: 16.h,
                              ),
                        _page == 2
                            ? BigText(
                                text: "Order",
                                color: redColor,
                                size: 14.sp,
                              )
                            : SvgPicture.asset(
                                "assets/order.svg",
                                // width: 30,
                                // color: _page == 0 ? blueColor : progressBackgroundColor,
                              )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _page == 3
                            ? BigText(
                                text: ".",
                                color: redColor,
                              )
                            : SizedBox(
                                height: 16.h,
                              ),
                        _page == 3
                            ? BigText(
                                text: "Notification",
                                color: redColor,
                                size: 14.sp,
                              )
                            : SvgPicture.asset(
                                "assets/notification_icon.svg",
                                // width: 30,
                                // color: _page == 0 ? blueColor : progressBackgroundColor,
                              )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _page == 4
                            ? BigText(
                                text: ".",
                                color: redColor,
                              )
                            : SizedBox(
                                height: 16.h,
                              ),
                        _page == 4
                            ? BigText(
                                text: "Profile",
                                color: redColor,
                                size: 14.sp,
                              )
                            : SvgPicture.asset(
                                "assets/profile.svg",
                                // width: 30,
                                // color: _page == 0 ? blueColor : progressBackgroundColor,
                              )
                      ],
                    ),
                  ),
                  // BottomNavigationBarItem(
                  //     icon: Padding(
                  //       padding: const EdgeInsets.only(top: 10.0),
                  //       child: Image.asset("assets/invoice.png",
                  //           // color: _page == 1 ? blueColor : progressBackgroundColor
                  //
                  //       ),
                  //     ),
                  //     backgroundColor: Colors.white),
                  // BottomNavigationBarItem(
                  //   icon: Padding(
                  //     padding: const EdgeInsets.only(top: 10.0),
                  //     child: Image.asset("assets/clients_icon.png",
                  //         height: 25.h,
                  //         // color: _page == 2 ? blueColor : progressBackgroundColor
                  //
                  //     ),
                  //   ),
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: Padding(
                  //     padding: const EdgeInsets.only(top: 10.0),
                  //     child: Image.asset(
                  //       "assets/estimate_icon.png",
                  //       // color: _page == 3 ? blueColor : progressBackgroundColor,
                  //     ),
                  //   ),
                  // ),
                ],
                onTap: navigationTapped,
              )),
        ),
      ),
    );
  }
}
