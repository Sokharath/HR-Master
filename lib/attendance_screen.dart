import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/app_constant.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/attendance_info.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({
    super.key,
    required this.minutesLate,
    required this.checkInTime,
    required this.minutesLeftEarly,
    required this.checkOutTime,
  });

  final int minutesLate;
  final DateTime? checkInTime;
  final int minutesLeftEarly;
  final DateTime? checkOutTime;

  String formatTimeInKhmer(DateTime time) {
    String formattedTime = DateFormat('hh:mm').format(time);
    String khmerPeriod = (time.hour < 12) ? 'ព្រឹក' : 'ល្ងាច';
    return '$formattedTime $khmerPeriod';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        title: const Text('របាយការណ៍វត្តមាន'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.chevron_left),
                  Text(
                    'មេសា ២០២៤',
                    style: AppTextStyle.instance.medium
                        .copyWith(color: Colors.black, fontSize: 17),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 330,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  AttendanceInfo item = attenDance[index];
                  return Container(
                    decoration: AppDecoration.instance.defaultBoxDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.totalInfo,
                                  style: AppTextStyle.instance.bold.copyWith(
                                    fontSize: 23.sp,
                                    color:
                                        const Color.fromRGBO(34, 34, 34, 0.75),
                                  ),
                                ),
                                Text(
                                  item.info,
                                  style: AppTextStyle.instance.regular
                                      .copyWith(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              bottom: 20,
                            ),
                            child: SvgPicture.asset(
                              item.icon,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: attenDance.length,
              ),
            ),
            Text(
              'ទិន្នន័យទាំងអស់',
              style: AppTextStyle.instance.medium.copyWith(fontSize: 18),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              decoration: AppDecoration.instance.defaultBoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'ថ្ងៃនេះ',
                      style: AppTextStyle.instance.medium,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset(
                            AppIcon.instance.hrLate,
                            width: 25,
                          ),
                        ),
                        Text(
                          'ចុះវត្តមាន',
                          style: AppTextStyle.instance.medium.copyWith(
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          minutesLate > 0
                              ? 'មកយឺត $minutesLate នាទី'
                              : 'You are on time',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.orange),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (checkInTime != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              formatTimeInKhmer(checkInTime!),
                              style: AppTextStyle.instance.medium.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          AppIcon.instance.hrLate,
                          width: 25,
                        ),
                      ),
                      Text(
                        'ពិនិត្យចេញ',
                        style: AppTextStyle.instance.medium.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        minutesLeftEarly > 0
                            ? 'ចេញមុន $minutesLeftEarly នាទី'
                            : 'You left on time',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.green),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (checkOutTime != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Text(
                            formatTimeInKhmer(checkOutTime!),
                            style: AppTextStyle.instance.medium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
