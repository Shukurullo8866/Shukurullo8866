import 'package:flutter/material.dart';
import 'package:todo_ap/utils/colors.dart';
import 'package:todo_ap/utils/images.dart';

class TodoCaregory {
  String name;
  String iconCode;
  Color colors;

  TodoCaregory({
    required this.name,
    required this.colors,
    required this.iconCode,
  });

  static List<TodoCaregory> categories = [
    TodoCaregory(name: "Grocery", iconCode: MyImages.iconGrocery, colors: MyColors.icon1),
    TodoCaregory(name: "Work", iconCode: MyImages.iconWork, colors: MyColors.icon2),
    TodoCaregory(name: "Sport", iconCode: MyImages.iconsport, colors: MyColors.icon3),
    TodoCaregory(name: "Design", iconCode:  MyImages.iconDesign, colors: MyColors.icon4),
    TodoCaregory(name: "University", iconCode:  MyImages.iconUniversity, colors: MyColors.icon5),
    TodoCaregory(name: "Social", iconCode:  MyImages.iconSocial, colors: MyColors.icon6),
    TodoCaregory(name: "Music", iconCode:  MyImages.iconMusic, colors: MyColors.icon7),
    TodoCaregory(name: "Health", iconCode:  MyImages.iconHealth, colors: MyColors.icon8),
    TodoCaregory(name: "Movie", iconCode:  MyImages.iconMovie, colors: MyColors.icon9),
    TodoCaregory(name: "Home", iconCode:  MyImages.iconHealth, colors: MyColors.icon10),
    TodoCaregory(name: "Create New", iconCode:  MyImages.iconCreateNew, colors: MyColors.icon11),

  ];
}
