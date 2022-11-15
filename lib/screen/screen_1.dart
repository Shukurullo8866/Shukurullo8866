// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/utils/colors.dart';
import '../theme_provider.dart';

class Custom extends StatelessWidget {
  const Custom({super.key});

  @override
  Widget build(BuildContext context) {
        var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight ? Colors.white : const Color.fromARGB(255, 46, 46, 46),
      body: PagedVerticalCalendar(
        /// customize the month header look by adding a week indicator
        monthBuilder: (context, month, year) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color:  MyColors.C_blu8875FF,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Text(
                  DateFormat('MMMM yyyy').format(DateTime(year, month)),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
    
              /// add a row showing the weekdays
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weekText('Mo'),
                    weekText('Tu'),
                    weekText('We'),
                    weekText('Th'),
                    weekText('Fr'),
                    weekText('Sa'),
                    weekText('Su'),
                  ],
                ),
              ),
            ],
          );
        },
    
        dayBuilder: (context, date) {
          return Column(
            children: [
              Text(DateFormat('d').format(date),style: TextStyle(color: isLight ? Colors.black : Colors.grey),),
               Divider(color: isLight ?Colors.black : Colors.grey,),
            ],
          );
        },
      ),
    );
  }

  Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }
}

