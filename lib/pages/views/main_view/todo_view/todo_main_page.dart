import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:student_media/models/controllers/task_controller.dart';
import 'package:student_media/utils/routes/routes.dart';
import 'package:student_media/utils/widgets/widgets.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({Key? key}) : super(key: key);

  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // ** TASKBAR HERE **
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat.yMMMd().format(DateTime.now()),
                            style: subHeadingStyle),
                        Text(
                          'Today',
                          style: headingStyle,
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                      label: '+  Add Task',
                      onTap: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              tasksPageRoute, (route) => false))
                ],
              ),
            ),
            // ** Date Bar is Here **
            Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.white,
                selectionColor: Colors.indigo,
                dateTextStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                dayTextStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                monthTextStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                onDateChange: (date) {
                  _selectedDate = date;
                },
              ),
            ),

           Expanded(
    child: Obx(
      () {
        final taskController = Get.put(TaskController());
        return ListView.builder(
           itemCount: taskController.taskList.length,
          itemBuilder: (_, context) {
            log(taskController.taskList.length.toString());
            return Container(
              height: 50,
              width: 150,
              color: Colors.greenAccent,
            );
          },
         
        );
      },
    ),
  ),
          ],
        ),
      ),
    );
  }
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

// _showTasks() {
//   return Expanded(
//     child: Obx(
//       () {
//         final taskController = Get.put(TaskController());
//         return ListView.builder(
//           itemBuilder: (_, context) {
//             print(taskController.taskList.length);
//             return Container(
//               height: 50,
//               width: 50,
//               color: Colors.greenAccent,
//             );
//           },
//           itemCount: taskController.taskList.length,
//         );
//       },
//     ),
//   );
// }
