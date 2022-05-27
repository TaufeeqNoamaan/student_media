import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:student_media/models/controllers/task_controller.dart';
import 'package:student_media/models/task.dart';
import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';
import 'package:student_media/utils/routes/routes.dart';
import 'package:student_media/utils/widgets/widgets.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final titleController = TextEditingController();

  final noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  int _selectedRem = 5;
  List<int> remList = [
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Weakly', 'Monthly'];

  _getDateFromUser(context) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = '9:30 PM';

  _getTimeFromUser({bool? isStartTime}) async {
    var pickedTime = await _showTimePicker(context);
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print('Time canceled');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker(context) {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(':')[0]),
          minute: int.parse(_startTime.split(':')[1].split(' ')[0]),
        ),
        initialEntryMode: TimePickerEntryMode.input);
  }

  int _selectedColor = 0;

  _validateDate() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      // add to database
      _addTaskToDb() {
        _taskController.addTask();
      }

      
      Navigator.of(context)
          .pushNamedAndRemoveUntil(mainPageRoute, (route) => false);
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      throw SnackBar(
        content: Text('All fields are Required'),
      );
    }
  }

  _addTaskToDb() async{
   int value = await _taskController.addTask( task:
    Task(
      note: noteController.text,
      title: titleController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRem,
      repeat: _selectedRepeat,
      color: _selectedColor,
      isCompleted: 0,
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(mainPageRoute, (route) => false),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.indigo,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              // ** The BODY
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        'Add Task',
                        style: GoogleFonts.lato(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // ** All the form fieds

                    // *? Title Field
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        'Title',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      height: 52,
                      width: 355,
                      child: TextField(
                        controller: titleController,
                        obscureText: false,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter title here',
                          suffixIcon: const Icon(Icons.title),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    // *? NOTE Field
                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        'Note',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      height: 52,
                      width: 355,
                      child: TextField(
                        controller: noteController,
                        obscureText: false,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter note here',
                          suffixIcon: const Icon(Icons.note_add),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    // *? DATE Field

                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        'Date',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      height: 52,
                      width: 355,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          _getDateFromUser(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                DateFormat.yMd().format(_selectedDate),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ),
                    ),
                    // *? Time Field
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 12, left: 15),
                                    child: Text(
                                      'Start Time',
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  height: 52,
                                  width: 170,
                                  child: GestureDetector(
                                    onTap: () {
                                      _getTimeFromUser(isStartTime: true);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          _startTime,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Icon(
                                          Icons.access_time,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    'End Time',
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.only(
                                  right: 15,
                                ),
                                height: 52,
                                width: 170,
                                child: GestureDetector(
                                  onTap: () {
                                    _getTimeFromUser(isStartTime: false);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        _endTime,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Icon(
                                        Icons.access_time,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // *? REMIND Field
                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        'Remind',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      height: 52,
                      width: 355,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              '$_selectedRem minutes early',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: DropdownButton(
                              underline: Container(
                                height: 0,
                              ),
                              iconSize: 30,
                              elevation: 4,
                              items: remList
                                  .map<DropdownMenuItem<String>>((int value) {
                                return DropdownMenuItem<String>(
                                  child: Text(value.toString()),
                                  value: value.toString(),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedRem = int.parse(newValue!);
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // *? REPEAT FIELD

                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        'Repeat',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      height: 52,
                      width: 355,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              '$_selectedRepeat',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: DropdownButton(
                              underline: Container(
                                height: 0,
                              ),
                              iconSize: 30,
                              elevation: 4,
                              items: repeatList.map<DropdownMenuItem<String>>(
                                  (String? value) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    value!,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedRepeat = newValue!;
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // *? COLOR Palette
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Color',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                children: List<Widget>.generate(3, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedColor = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: CircleAvatar(
                                        child: _selectedColor == index
                                            ? Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 20,
                                              )
                                            : Container(),
                                        radius: 15,
                                        backgroundColor: index == 0
                                            ? Colors.indigoAccent
                                            : index == 1
                                                ? Colors.pinkAccent
                                                : Colors.amberAccent,
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                          MyButton(
                              label: 'Create Task',
                              onTap: () {
                                _validateDate();
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
