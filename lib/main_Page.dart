// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, unnecessary_new, duplicate_ignore

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/profile_Page.dart';
import 'package:todo_ap/screen/screen_1.dart';
import 'package:todo_ap/theme_provider.dart';
import 'package:todo_ap/utils/colors.dart';
import 'package:todo_ap/utils/images.dart';
import 'package:todo_ap/widgets/add_task._widget.dart';
import 'package:todo_ap/widgets/timer/hors_Page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget>  _pages = [
       HomePage(),
      Custom(),
      Container(),
      AttendanceScreen(),
      const ProfileWidget(),
    ];

    Future<bool> _onWillPop() async {
      if(_selectedIndex != 0){
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      }
      
      
      return (await showDialog(
        context: context,
        // ignore: unnecessary_new
        builder: (context)  =>  new AlertDialog(
          title: new Text("Are you sure?"),
          content:  new  Text("Do you want to exit an App"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Yes"),
            ),
          ],
        ),
      )) ??
      false;
    }
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _pages[_selectedIndex],
        backgroundColor: isLight ? Colors.white  : Colors.black,
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      height: 350,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          color: MyColors.color_indicator),
                      child: Column(
                        children: [
                          SvgPicture.asset(MyImages.icon_share),
                          const SizedBox(height: 12),
                          Text(
                            "Please hold your finger at "
                            "the fingerprint scanner to verify your identity",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.87),
                                fontSize: 20),
                          ),
                          const SizedBox(height: 48),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 48),
                                  backgroundColor: MyColors.color_indicator,
                                  shadowColor: null,
                                  elevation: 0,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: MyColors.C_blu8875FF),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(150, 48),
                                    backgroundColor: MyColors.color_indicator),
                                onPressed: () {},
                                child: const Text(
                                  "Use Password",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            icon: SvgPicture.asset(MyImages.icon_todo4),
          ),
          backgroundColor: isLight ? const Color.fromARGB(255, 129, 125, 125) :  MyColors.color_indicator,
          title:  Text("HomePage".tr()),
          actions: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/300",
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
        floatingActionButton: Stack(children: [
          Positioned(
            bottom: 34,
            left: 155.9,
            child: Container(
              width: 90,
              height: 45.5,
              decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(76, 80),
                      bottomRight: Radius.elliptical(76, 80))),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 165,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: MyColors.color_indicator,
                  context: context,
                  builder: (context) {
                    return AddTaskWidget(
                      onNewTask: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                    );
                  },
                );
              },
              child: Container(
                  height: 72,
                  width: 72,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: MyColors.C_blu8875FF),
                  child: const Center(
                    child: Text(
                      "+",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )),
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: 28,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.50),
            backgroundColor: isLight ? const Color.fromARGB(255, 129, 125, 125) :  MyColors.color_indicator,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Index',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(null),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined),
                label: 'Focus',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
