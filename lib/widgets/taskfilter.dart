import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/screens/test_page.dart';

class TaskFilter extends StatefulWidget {
  final BoxConstraints constraints;
  const TaskFilter({super.key, required this.constraints});
  @override
  State<TaskFilter> createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight * 0.035,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.01),
                child: FilterOption(
                  constraints: constraints,
                  filterLabel: filterLabel[index],
                  isSelected: selectedIndex == index,
                  onSelected: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class FilterOption extends StatelessWidget {
  final BoxConstraints constraints;
  final String filterLabel;
  bool isSelected;
  final VoidCallback onSelected;
  FilterOption({
    super.key,
    required this.constraints,
    required this.filterLabel,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(constraints.maxWidth * 0.05),
            border: Border.all(width: 1, color: AppColor.primaryColor),
            color: isSelected ? AppColor.primaryColor : Colors.white),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
          child: Center(
            child: Text(
              filterLabel,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? null : 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
