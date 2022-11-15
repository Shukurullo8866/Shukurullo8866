// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/database/category.dart';
import 'package:todo_ap/utils/colors.dart';
import '../database/local_database.dart';
import '../database/todo_Model.dart';
import '../theme_provider.dart';
import '../utils/time_utils.dart';

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  TodoModel? model;
  final VoidCallback onDeleted;
  final VoidCallback onSelected;
  final ValueChanged<TodoModel> onCompleted;

  TaskItem({
    Key? key,
    required this.model,
    required this.onDeleted,
    required this.onSelected,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var isLight = context.watch<ThemeProvider>().getIsLight();

    return InkWell(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(11),
        color: isLight? Color.fromARGB(255, 94, 94, 94) : MyColors.color_indicator,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (() {
                onCompleted(model!.copyWith(isCompleted: 1));
              }),
              child: Container(
                decoration: BoxDecoration(
                  color: model!.isCompleted == 1
                      ? MyColors.C_blu8875FF
                      :Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                height: 20 ,
                width: 20,
              ),
            ),
           const SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model?.id.toString() ?? "-1",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  model?.title.toString() ?? "No title",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                model!.date != "null"
                    ? Text(
                        TimeUtils.formatToMyTime(DateTime.parse(model!.date)),
                        style: const TextStyle(color: Colors.white),
                      )
                    : const Text(""),
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 6, left: 5, right: 4, bottom: 2),
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TodoCaregory.categories[model!.categoryId].colors),
              child: Row(
                children: [
                  SvgPicture.asset(
                      TodoCaregory.categories[model!.categoryId].iconCode),
                  // color: TodoCaregory.categories[model!.categoryId].colors,

                  const SizedBox(width: 4),
                  Text(
                    TodoCaregory.categories[model!.categoryId].name,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    barrierColor: MyColors.color_indicator.withOpacity(0.8),
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: MyColors.color_indicator,
                        title: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Text(
                          "Are you sure to delete task ${model?.title}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "NO",
                              style: TextStyle(color: MyColors.C_blu8875FF),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              var res = await LocalDatabase.deleteTaskById(
                                  model!.id!);
                              if (res != 0) {
                                Navigator.pop(context);
                                onDeleted();
                              }
                            },
                            child: const Text(
                              "YES",
                              style: TextStyle(color: MyColors.C_blu8875FF),
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
