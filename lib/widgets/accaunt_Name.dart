// ignore_for_file: file_names, unnecessary_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/storage_servise.dart/storage.dart';
import 'package:todo_ap/utils/colors.dart';

import '../theme_provider.dart';

class AccauntWidget extends StatefulWidget {
  VoidCallback onSet;
  AccauntWidget({required this.onSet, super.key});

  @override
  State<AccauntWidget> createState() => _AccauntWidgetState();
}

String accauntName = StorageService.getString("accauntName");

class _AccauntWidgetState extends State<AccauntWidget> {
  @override
  Widget build(BuildContext context) {
     var isLight = context.watch<ThemeProvider>().getIsLight();
    return AlertDialog(
      backgroundColor: isLight ? const Color.fromARGB(255, 161, 161, 161) : MyColors.color_indicator,
      title: const Text("Change name"),
      content: TextFormField(
        initialValue: accauntName,
        onChanged: (valu) {
          setState(() {
            accauntName = valu;
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            setState(() {
              
              widget.onSet();
            });
            await StorageService.saveString("accauntName", accauntName);
          },
          child:  Text("Save",style: TextStyle(color: isLight ? MyColors.C_blu8875FF : const Color.fromARGB(255, 181, 132, 245)),),
        ),
      ],
    );
  }
}
