import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../hr_text_style.dart';

class HRTextField extends StatefulWidget {
  const HRTextField({
    super.key,
    required this.placeholderText,
    this.controller,
    this.height,
  });

  final String placeholderText;
  final TextEditingController? controller;
  final double? height;

  @override
  State<HRTextField> createState() => _HRTextFieldState();
}

class _HRTextFieldState extends State<HRTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.placeholderText,
          style: AppTextStyle.instance.medium,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: widget.height,
          child: TextField(
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(85, 158, 158, 158), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(85, 158, 158, 158), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(85, 158, 158, 158), width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            ),
          ),
        ),
      ],
    );
  }
}
