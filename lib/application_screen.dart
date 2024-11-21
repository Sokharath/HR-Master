import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/base_tabbar.dart';
import 'package:hr_master/utils/app_image.dart';

import 'attendance_report.dart';
import 'my_attendance.dart';
import 'setting_screen.dart';
import 'tabbar_scaffold.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        title: const Text('កម្មវិធី'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                AppIcon.instance.setting,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            _reusableContainer(
              'ការសុំច្បាប់របស់ខ្ញុំ',
              'របាយការណ៍ ច្បាប់ឈប់សម្រាក',
              AppIcon.instance.hrGroup,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAttendance(),
                  ),
                );
              },
            ),
            _reusableContainer(
              'របាយការណ៍ ច្បាប់ឈប់សម្រាក',
              'ពិនិត្យមើលព័ត៌មាន ច្បាប់ឈប់សម្រាក',
              AppIcon.instance.report,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AttendanceReport(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _reusableContainer(String title, String titleInfo, String icon,
      dynamic Function() onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              icon,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.instance.medium.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  titleInfo,
                  style: AppTextStyle.instance.medium
                      .copyWith(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
