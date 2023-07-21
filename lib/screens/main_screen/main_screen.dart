import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/screens/login_screen.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/home_screen.dart';
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
      LoginScreen(),
      LoginScreen(),
      LoginScreen(),
      LoginScreen(),
    ];

    return Scaffold(
        // drawer: NavigationDrawerWidget(),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          children: mainScreenItems,
        ),
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
                    _page == 0 ? BigText(text: ".", color: redColor,):SizedBox(height: 16.h,),
                    _page == 0 ? BigText(text: "Home",color: redColor,size: 14.sp,): SvgPicture.asset(
                      "assets/profile.svg",
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
                  _page == 1 ? BigText(text: ".", color: redColor,):SizedBox(height: 16.h,),
                  _page == 1 ? BigText(text: "Favorite",color: redColor,size: 14.sp,): SvgPicture.asset(
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
                  _page == 2 ? BigText(text: ".", color: redColor,):SizedBox(height: 16.h,),
                  _page == 2 ? BigText(text: "Cart",color: redColor,size: 14.sp,): SvgPicture.asset(
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
                  _page == 3 ? BigText(text: ".", color: redColor,):SizedBox(height: 16.h,),
                  _page == 3 ? BigText(text: "Notification",color: redColor,size: 14.sp,): SvgPicture.asset(
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
                  _page == 4 ? BigText(text: ".", color: redColor,):SizedBox(height: 16.h,),
                  _page == 4 ? BigText(text: "Profile",color: redColor,size: 14.sp,): SvgPicture.asset(
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
        ));
  }
}
