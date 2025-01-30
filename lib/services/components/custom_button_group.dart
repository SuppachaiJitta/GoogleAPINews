import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonGroup extends StatefulWidget {
  final List<String> options;
  int selectedIndex;
  final Function(int) onChanged;

  CustomButtonGroup({
    super.key,
    required this.options,
    required this.onChanged,
    this.selectedIndex = 0,
  });

  @override
  CustomButtonGroupState createState() => CustomButtonGroupState();
}

class CustomButtonGroupState extends State<CustomButtonGroup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.options.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              widget.selectedIndex = index;
              widget.onChanged(widget.selectedIndex);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color:
                    widget.selectedIndex == index ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 100,
                minHeight: 20,
              ),
              child: Center(
                child: Text(
                  widget.options[index],
                  style: TextStyle(
                    color: widget.selectedIndex == index
                        ? Colors.black
                        : Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
