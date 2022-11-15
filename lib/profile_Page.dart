// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/storage_servise.dart/storage.dart';
import 'package:todo_ap/theme_mode_item.dart';
import 'package:todo_ap/theme_provider.dart';
import 'package:todo_ap/utils/colors.dart';
import 'package:todo_ap/utils/images.dart';
import 'package:todo_ap/widgets/accaunt_Name.dart';
import 'package:todo_ap/widgets/complatet.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  int selectedlang = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      accauntName = StorageService.getString("accauntName");
    });
    
  }

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight ?Colors.white: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                "                             Profiled",
                style: TextStyle(color: isLight ? Colors.black : Colors.white, fontSize: 23),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 85,
                height: 85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(85),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "                                 $accauntName",
                style:  TextStyle(
                    color: isLight ? Colors.black : const Color.fromARGB(255, 199, 193, 247),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: isLight ? const Color.fromARGB(255, 129, 125, 125) :  MyColors.color_indicator,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child:  Center(
                      child: Text(
                        "10Task left",
                        style: TextStyle(
                            color: isLight ? Colors.black : Colors.white ,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    width: 153,
                    height: 58,
                    decoration: BoxDecoration(
                      color: isLight? const Color.fromARGB(255, 129, 125, 125) :  MyColors.color_indicator,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child:  Center(
                      child: Text(
                        "5 Task done",
                        style: TextStyle(
                            color: isLight? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              texts("Setings",isLight),
              const SizedBox(height: 4),
              buildAccaountOption(context, "App_Settings".tr(),
                  MyImages.setting, const ThemeModeItem(),isLight),
              texts("Accaunt",isLight),
              buildAccaountOption(context, "Change_account_name".tr(),
                  MyImages.user , AccauntWidget(
                    onSet: () => setState(() {
                    
                  }),), isLight ),
              buildAccaountOption(context, "Change account password".tr(),
                  MyImages.key, const LocaolizationWidget(), isLight ),
              buildAccaountOption(context, "Change account Image".tr(),
                  MyImages.camera, const LocaolizationWidget(), isLight ),
              texts("Uptodo",isLight),
              buildAccaountOption(context, "Abaut US".tr(), MyImages.menu,
                  const LocaolizationWidget(), isLight, ),
              buildAccaountOption(context, "FAQ".tr(), MyImages.info_circle,
                 const LocaolizationWidget(), isLight ),
              buildAccaountOption(context, "Help Feedback".tr(), MyImages.flash,
                  const LocaolizationWidget(), isLight),
              buildAccaountOption(context, "Support US".tr(), MyImages.like,
                 const LocaolizationWidget(), isLight),
              const SizedBox(height: 30),
          
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAccaountOption(
      BuildContext context, String title, String icon, Widget widgets ,bool isLight) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        showModalBottomSheet(
          backgroundColor: MyColors.color_indicator,
          context: context,
          builder: (context) {
            return widgets;
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(icon,color:isLight ? Colors.black : Colors.white ,),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: isLight ? Colors.black : Colors.white),
            ),
             Icon(
              Icons.arrow_forward_ios,
              color: isLight ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget texts(String title,bool isLight ) {
    return Padding(
      padding:  const EdgeInsets.only(left: 24, top: 5, bottom: 4),
      child: Text(
        title,
        style:  TextStyle(
            color: isLight ? Colors.black : MyColors.Text_C ,
             fontSize: 14, 
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
