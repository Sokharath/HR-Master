import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_master/app_constant.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/utils/app_image.dart';

class AttendanceReport extends StatelessWidget {
  const AttendanceReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        title: Text(
          'របាយការណ៍ ច្បាប់ឈប់សំរាក់',
          style: AppTextStyle.instance.medium.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                    ),
                    Text(
                      '2024',
                      style:
                          AppTextStyle.instance.medium.copyWith(fontSize: 20),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'សមតុល្យទាំងអស់',
                style: AppTextStyle.instance.medium,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ចំនួនសរុប នៃច្បាប់សម្រាក់',
                      style: AppTextStyle.instance.medium,
                    ),
                    const Divider(),
                    const AttendanceProgress(
                      totalAtt: 'ច្បាប់សម្រាក្រចាំឆ្នាំ : 12',
                      totalLeft: 'នៅសល់ 5',
                      progressValue: 1,
                    ),
                    const AttendanceProgress(
                      totalAtt: 'ច្បាប់ឈឺ : 7',
                      totalLeft: 'នៅសល់ 6',
                      progressValue: 0,
                    ),
                    const AttendanceProgress(
                      totalAtt: 'ច្បាប់សម្រាកពិសេស : 7',
                      totalLeft: 'នៅសល់ 7',
                      progressValue: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'សម្រាយគិតជាខែ',
                style: AppTextStyle.instance.medium,
              ),
            ),
            _monthTotalAttendance(),
            _monthTotalAttendance(),
            _monthTotalAttendance(),
            _monthTotalAttendance(),
          ],
        ),
      ),
    );
  }

  Widget _monthTotalAttendance() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: AppDecoration.instance.defaultBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppIcon.instance.calendar,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'មករា',
                  style: AppTextStyle.instance.medium.copyWith(
                    color: const Color.fromRGBO(43, 43, 61, 0.7),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'ការប្រើប្រាស់សរុប',
                  style: AppTextStyle.instance.bold.copyWith(
                    color: const Color.fromRGBO(43, 43, 61, 0.9),
                  ),
                ),
                Text(
                  '១ ថ្ងៃ',
                  style: AppTextStyle.instance.medium.copyWith(
                    color: const Color.fromRGBO(43, 43, 61, 0.7),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AttendanceProgress extends StatelessWidget {
  const AttendanceProgress({
    super.key,
    required this.totalAtt,
    required this.totalLeft,
    required this.progressValue,
  });
  final String totalAtt;
  final String totalLeft;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                totalAtt,
                style: AppTextStyle.instance.bold,
              ),
              Text(
                totalLeft,
                style:
                    AppTextStyle.instance.regular.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: LinearProgressIndicator(
              value: progressValue,
              color: Colors.green,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
