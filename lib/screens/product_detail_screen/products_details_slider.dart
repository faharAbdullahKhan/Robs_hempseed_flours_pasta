import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';

class productsDetailsSlider extends StatefulWidget {
  const productsDetailsSlider({super.key});

  @override
  State<productsDetailsSlider> createState() => _productsDetailsSliderState();
}

class _productsDetailsSliderState extends State<productsDetailsSlider> {

  List<int> listOfSliderIages = [1, 2];
  PageController pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        color: carasoulBackground,
      ),
      height: 380.h,
      child: PageView.builder(
        controller: pageViewController,
        itemCount: listOfSliderIages.length,
        itemBuilder: (context, int currentIndex) {
          return Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    'assets/slider_image.png',
                    fit: BoxFit.contain,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  color: Colors.transparent,
                ),
                width: double.infinity,
                height: 380.h,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // width: double.infinity,
                      height: 20,
                      //color: Colors.white,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listOfSliderIages.length,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.5, horizontal: 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(50),
                                  color: currentIndex == index
                                      ? Colors.redAccent
                                      : searchHintColor,
                                ),
                                width:
                                currentIndex == index ? 20 : 10,
                                height: 10,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
