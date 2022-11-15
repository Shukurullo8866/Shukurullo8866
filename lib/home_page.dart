// ignore_for_file: void_checks, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/database/todo_Model.dart';
import 'package:todo_ap/theme_provider.dart';
import 'package:todo_ap/utils/colors.dart';
import 'package:todo_ap/widgets/shimmer_Page.dart';
import 'package:todo_ap/widgets/task_item.dart';
import 'package:todo_ap/widgets/update_task.dart';
import 'database/local_database.dart';

class HomePage extends StatefulWidget {
  
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight ? const Color.fromARGB(255, 208, 206, 206) : Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchTodo(),
            todayTodos( set(),isLight),
            conplatedTodos(isLight),
          ],
        ),
      ),
    );
  }

   set(){
     setState(() {
      
    }); 
  }

  Widget searchTodo() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        onChanged: (val) {
          setState(() {
            search = val;
          });
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          filled: true,
          fillColor: MyColors.color_indicator.withOpacity(0.5),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
          )),
        ),
      ),
    );
  }

  Widget todayTodos(void onUpdatedTask, var isLight) {
    VoidCallback onUpdatedTask;
    return SingleChildScrollView(
      child: ExpansionTile(
        initiallyExpanded: true,
        iconColor: isLight? Colors.black: Colors.white,
        title:  Text(
          "Uncomplated",
          style: TextStyle(color: isLight ? Colors.black : Colors.white),
        ),
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
              future: LocalDatabase.getTodosIsCompleted(0),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TodoModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                        child: Icon(
                      Icons.file_copy_outlined,
                      color: Colors.white,
                      size: 96,
                    ));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        onCompleted: (todo) {
                          setState(() {
                            LocalDatabase.updateTaskById(
                              todo.copyWith(isCompleted: 1),
                            );
                          });
                        },
                        model: snapshot.data?[index],
                        onDeleted: () {
                          setState(() {});
                        },
                        onSelected: () {
                          showModalBottomSheet(
                            backgroundColor: MyColors.color_indicator,
                            context: context,
                            builder: (context) {
                              return UpdateTaskWidget(
                                todo: snapshot.data![index],
                                onUpdatedTask: () {
                                  setState(() {});
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                return Center(
                  child: Column(
                    children: const [
                      ShimmerWidget(),
                      ShimmerWidget(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget conplatedTodos(var isLight) {
    return SingleChildScrollView(
      child: ExpansionTile(
        initiallyExpanded: true,
        iconColor: isLight ? Colors.black: Colors.white,
        title:  Text(
          "Complated",
          style: TextStyle(color: isLight ? Colors.black : Colors.white),
        ),
        children: [
          FutureBuilder(
            future: LocalDatabase.getTodosIsCompleted(1),
            builder: (BuildContext context,
                AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                      child: Icon(
                    Icons.file_copy_outlined,
                    color: Colors.white,
                    size: 96,
                  ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      model: snapshot.data?[index],
                      onCompleted: (todo) {
                        setState(() {
                          LocalDatabase.updateTaskById(
                            todo.copyWith(isCompleted: 0),
                          );
                        });
                      },
                      onDeleted: () {
                        setState(() {});
                      },
                      onSelected: () {
                        showModalBottomSheet(
                          backgroundColor: MyColors.color_indicator,
                          context: context,
                          builder: (context) {
                            return UpdateTaskWidget(
                              todo: snapshot.data![index],
                              onUpdatedTask: () {
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              return Center(
                child: Column(
                  children: const [
                    ShimmerWidget(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
