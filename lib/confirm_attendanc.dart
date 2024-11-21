import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/app_constant.dart';
import 'package:hr_master/attendance_info.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/utils/app_image.dart';

class ConfirmAttendance extends StatelessWidget {
  const ConfirmAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ស្នើសុំច្បាប់លម្អិត'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: AppDecoration.instance.defaultBoxDecoration.copyWith(
                color: const Color.fromRGBO(155, 159, 67, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ស្ថានភាព',
                      style: AppTextStyle.instance.bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'កំពុងត្រួតពិនិត្យ',
                      style: AppTextStyle.instance.bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                'ព័ត៌មានស្នើសុំ',
                style: AppTextStyle.instance.medium,
              ),
            ),
            Container(
              decoration: AppDecoration.instance.defaultBoxDecoration,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'សង្ខេប',
                      style: AppTextStyle.instance.medium
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        itemCount: pendingData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          AttendancePending data = pendingData[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.title,
                                style: AppTextStyle.instance.medium
                                    .copyWith(color: Colors.grey),
                              ),
                              Text(
                                data.titleInfo,
                                style: AppTextStyle.instance.medium,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Text(
                      'អនុម័តដោយ',
                      style: AppTextStyle.instance.medium
                          .copyWith(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: Image.asset(
                            AppIcon.instance.adminAvatar,
                            height: 60,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Viroth Chanrith',
                              style: AppTextStyle.instance.medium.copyWith(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'អ្នកដឹកនាំអ្នករចនា',
                              style: AppTextStyle.instance.medium
                                  .copyWith(fontSize: 14, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'កាលវិភាគ',
                style: AppTextStyle.instance.medium,
              ),
            ),
            Container(
              decoration: AppDecoration.instance.defaultBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ចាប់ពី',
                      style: AppTextStyle.instance.medium,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcon.instance.calendarStats,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ថ្ងៃចន្ទ័ ២៥ មេសា ២០២៤',
                          style: AppTextStyle.instance.medium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ចាប់ពី',
                      style: AppTextStyle.instance.medium,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcon.instance.calendarStats,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ថ្ងៃចន្ទ័ ២៥ មេសា ២០២៤',
                          style: AppTextStyle.instance.medium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
