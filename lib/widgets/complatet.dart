import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../utils/colors.dart';

class LocaolizationWidget extends StatefulWidget {
  const LocaolizationWidget({super.key});

  @override
  State<LocaolizationWidget> createState() => _LocaolizationWidgetState();
}

class _LocaolizationWidgetState extends State<LocaolizationWidget> {
  int selectedlang = 0;
  
  @override
  Widget build(BuildContext context) {
        var isLight = context.watch<ThemeProvider>().getIsLight();
 return Scaffold(
      backgroundColor: isLight ? Colors.white : MyColors.color_indicator,
      body: SafeArea(
        child: Column(
          children: [
            RadioListTile(
              activeColor: MyColors.C_blu8875FF,
              title: const Text("Uzbeki"),
              value: 1,
              groupValue: selectedlang,
              onChanged: (val) {
                context.setLocale(Locale("uz", "UZ"));
                setState() {
                  selectedlang = val as int;
                }
              },
            ),
            RadioListTile(
              activeColor: MyColors.C_blu8875FF,
              title: Text("Russia"),
              value: 2,
              groupValue: selectedlang,
              onChanged: (val) {
                 context.setLocale(
                  Locale("ru", "RU"),
                );
                setState() {
                  selectedlang = val as int;
                }

                
               
              },
            ),
            RadioListTile(
              activeColor: MyColors.C_blu8875FF,
              title: const Text("England"),
              value: 3,
              groupValue: selectedlang,
              onChanged: (val) {
                selectedlang = val as int;
                context.setLocale(
                  Locale("en", "US"),
                );
                setState() {
                  selectedlang = val as int;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
