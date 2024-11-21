import 'package:flutter/material.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/tabbar_scaffold.dart';

class MyAttendance extends StatelessWidget {
  const MyAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ច្បាប់របស់ខ្ញុំ',
          style: AppTextStyle.instance.medium.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: TabbarScaffold(),
    );
  }
}
