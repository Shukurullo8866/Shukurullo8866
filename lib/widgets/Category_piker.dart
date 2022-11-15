// ignore_for_file: file_names, duplicate_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_ap/database/category.dart';
import '../../database/category.dart';

class CategoryPiker extends StatefulWidget {
  ValueChanged<int> onSelected;
  CategoryPiker({super.key, required this.onSelected});

  @override
  State<CategoryPiker> createState() => _CategoryPikerState();
}

class _CategoryPikerState extends State<CategoryPiker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: GridView.builder( itemCount: TodoCaregory.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          mainAxisExtent: 95,
          crossAxisCount: 3,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return categoryItem(TodoCaregory.categories[index], index);
        },
      ),
    );
  }
  Widget categoryItem(TodoCaregory category, int index) {
    return InkWell(
      onTap: () {
        widget.onSelected(index);
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            color: category.colors,
            child: Center(
              child: SvgPicture.asset(category.iconCode,)
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              category.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
