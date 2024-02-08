import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

class CreateBottomTaskSheet extends StatefulWidget {
  const CreateBottomTaskSheet({super.key});

  @override
  State<CreateBottomTaskSheet> createState() => _CreateBottomTaskSheetState();
}

class _CreateBottomTaskSheetState extends State<CreateBottomTaskSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _title;
  String? _description;
  void setInputData() {
    setState(() {
      _title = _titleController.text;
      _description = _descriptionController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create New Task",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: TextFormField(
                  controller: _titleController,
                  decoration: textFieldDecoration(labelText: "Title"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: TextFormField(
                  controller: _descriptionController,
                  decoration: textFieldDecoration(labelText: "Description"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                          ),
                        ),
                        Text(
                          "Task Date",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ],
                    ),
                    const Text("Select Date"),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: const TimeSelector(
                      label: "Start Time",
                      icon: Icons.access_time_rounded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: const TimeSelector(
                      label: "End Time",
                      icon: Icons.access_time_filled_rounded,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setInputData();
                    debugPrint("Title: $_title");
                    debugPrint("Description: $_description");
                    Navigator.of(context).pop();
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
  );
}

class TimeSelector extends StatefulWidget {
  final String label;
  final IconData icon;
  const TimeSelector({super.key, required this.label, required this.icon});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          size: MediaQuery.of(context).size.width * 0.06,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
          ),
        ),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        ),
      ],
    );
  }
}
