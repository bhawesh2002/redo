import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';
import 'package:redo/utilis/days.dart';

class CreateBottomTaskSheet extends StatefulWidget {
  const CreateBottomTaskSheet({super.key});

  @override
  State<CreateBottomTaskSheet> createState() => _CreateBottomTaskSheetState();
}

class _CreateBottomTaskSheetState extends State<CreateBottomTaskSheet> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<_TimeSelectorState> _startTimeSelectorKey =
      GlobalKey<_TimeSelectorState>();
  final GlobalKey<_TimeSelectorState> _endTimeSelectorKey =
      GlobalKey<_TimeSelectorState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _title;
  String? _description;
  late DateTime? _selectedDate = DateTime.now();
  // ignore: avoid_init_to_null
  late TimeOfDay? _startTime = null;
  // ignore: avoid_init_to_null
  late TimeOfDay? _endTime = null;

  void setInputData() {
    setState(
      () {
        try {
          _title = _titleController.text;
          _description = _descriptionController.text;
          String start =
              "${_selectedDate.toString().split(" ").first} ${_startTime?.hour.toString()}:${_startTime?.minute.toString()}";
          String end =
              "${_selectedDate.toString().split(" ").first} ${_endTime?.hour.toString()}:${_endTime?.minute.toString()}";
          final newTask = Todo(
            id: "0",
            title: _title!,
            description: _description!,
            start: DateTime.parse(start),
            end: DateTime.parse(end),
            isCompleted: false,
          );
          addTask(newTask);
          debugPrint('Task added successfully!');
        } catch (e) {
          debugPrint('Error adding task: $e');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create New Task",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.01,
                        vertical: constraints.maxHeight * 0.02,
                      ),
                      child: TextFormField(
                          controller: _titleController,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          validator: (value) {
                            return value!.isEmpty ? "Title is required" : null;
                          },
                          decoration: textFieldDecoration(labelText: "Title")),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.01,
                        vertical: constraints.maxHeight * 0.02,
                      ),
                      child: TextFormField(
                        controller: _descriptionController,
                        decoration:
                            textFieldDecoration(labelText: "Description"),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.04,
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        setState(() {
                          if (date != null) {
                            _selectedDate = date;
                          }
                        });
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.02),
                          child: DateSelector(
                              date: _selectedDate, constraints: constraints)),
                    ),
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialTime: _startTime ?? TimeOfDay.now(),
                              );
                              setState(() {
                                if (time != null) {
                                  _startTime = time;
                                }
                              });
                              _startTimeSelectorKey.currentState!.validate();
                            },
                            child: TimeSelector(
                              key: _startTimeSelectorKey,
                              label: "Start Time",
                              time: _startTime,
                              icon: Icons.access_time_rounded,
                              constraints: constraints,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialTime: _endTime ?? TimeOfDay.now(),
                              );

                              setState(() {
                                if (time != null) {
                                  _endTime = time;
                                }
                              });
                              _endTimeSelectorKey.currentState!.validate();
                            },
                            child: TimeSelector(
                              key: _endTimeSelectorKey,
                              label: "End Time",
                              time: _endTime,
                              icon: Icons.access_time_filled_rounded,
                              constraints: constraints,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Flexible(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (!_startTimeSelectorKey.currentState!
                                .validate()) {
                              if (!_endTimeSelectorKey.currentState!
                                  .validate()) {
                                setInputData();
                                Navigator.of(context).pop();
                              }
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Create",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

InputDecoration textFieldDecoration({required String labelText}) {
  return InputDecoration(
    labelText: labelText,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 3,
          color: AppColor.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.teal.shade100,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.redAccent,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 3,
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.circular(10)),
  );
}

class DateSelector extends StatefulWidget {
  final DateTime? date;
  final BoxConstraints constraints;
  const DateSelector({
    super.key,
    required this.date,
    required this.constraints,
  });

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month_rounded,
              size: widget.constraints.maxWidth * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.constraints.maxWidth * 0.01,
              ),
            ),
            Text(
              widget.date.toString().split(" ").first,
              style: TextStyle(
                fontSize: widget.constraints.maxWidth * 0.04,
              ),
            ),
          ],
        ),
        Text(weekday[DateTime.now().weekday - 1] ==
                weekday[widget.date!.weekday - 1]
            ? "Today"
            : weekday[widget.date!.weekday - 1]),
      ],
    );
  }
}

class TimeSelector extends StatefulWidget {
  final TimeOfDay? time;
  final String label;
  final IconData icon;
  final BoxConstraints constraints;
  const TimeSelector({
    super.key,
    required this.time,
    required this.label,
    required this.icon,
    required this.constraints,
  });

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  Color color = Colors.black;
  bool nullCheck() {
    if (widget.time == null) {
      return true;
    }
    setState(() {
      color = Colors.teal;
    });
    return false;
  }

  bool validate() {
    if (widget.time == null) {
      setState(() {
        color = Colors.redAccent;
      });
      return true;
    }
    setState(() {
      color = Colors.teal;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: nullCheck() ? color : Colors.teal,
          size: widget.constraints.maxWidth * 0.06,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.constraints.maxWidth * 0.01,
          ),
        ),
        Text(
          nullCheck()
              ? widget.label
              : "${widget.time?.hour.toString()}:${widget.time?.minute.toString()}",
          style: TextStyle(
            color: color,
            fontSize: widget.constraints.maxWidth * 0.04,
          ),
        ),
      ],
    );
  }
}
