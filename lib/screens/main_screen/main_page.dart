import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/drawer_screen.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/home_screen.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/main_screen.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(),
        ],
      ),
    );
  }
}
