// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_ap/utils/colors.dart';
import 'package:todo_ap/widgets/Priority_picer.dart';
import '../database/local_database.dart';
import '../database/todo_Model.dart';
import '../utils/images.dart';
import 'Category_piker.dart';

class AddTaskWidget extends StatefulWidget {
  VoidCallback onNewTask;

  AddTaskWidget({Key? key, required this.onNewTask}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDay; // 02.11.2022 ----
  TimeOfDay? taskTime; // ---------- 21:25
  int categoryId = 0;
  int priority = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onSaved: (val) {
                newTitle = val ?? "";
              },
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              onSaved: (val) {
                newDescription = val ?? "";
              },
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    taskDay = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2300),
                    );
                    taskTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    taskDay = DateTime(
                      taskDay!.year,
                      taskDay!.month,
                      taskDay!.day,
                      taskTime!.hour,
                      taskTime!.minute,
                    );
                  },
                  icon: SvgPicture.asset(MyImages.icon_timerto),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: MyColors.color_indicator,
                        content: CategoryPiker(
                          onSelected: (index) {
                            categoryId = index;
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(MyImages.icon_todo2),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: MyColors.color_indicator,
                        content: PrioritiyPicer(
                          onSelected: (index) {
                            priority = index;
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(MyImages.icon_todo4),
                ),
                const SizedBox(width: 167.0),
                IconButton(
                  onPressed: () {
                    formKey.currentState?.save();
                    if (newTitle.isNotEmpty &&
                        newDescription.isNotEmpty &&
                        taskDay != null &&
                        categoryId != -1) {
                      var newTodo = TodoModel(
                        title: newTitle,
                        description: newDescription,
                        date: (taskDay ?? DateTime.now()).toString(),
                        categoryId: categoryId,
                        priority: priority,
                        isCompleted: 0,
                      );
                      LocalDatabase.insertToDatabase(newTodo);
                      setState(() {
                        widget.onNewTask();
                      Navigator.pop(context);
                      });
                      
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Oshibka qildin"),
                          content: const Text("Hamasn toldrin"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Chundm"),
                            )
                          ],
                        ),
                      );
                    }
                  },
                  icon: SvgPicture.asset(MyImages.icon_todo3),
                ),
              ],
            ),
            Text(
              taskDay.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
