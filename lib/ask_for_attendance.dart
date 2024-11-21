import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_master/app_constant.dart';
import 'package:hr_master/bloc/bloc/period_type_bloc.dart';
import 'package:hr_master/bloc/period_attendance.bloc/period_attendance_bloc.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/utils/textfield.dart';

import 'confirm_attendanc.dart';

class AskForAttendance extends StatefulWidget {
  const AskForAttendance({super.key});

  @override
  State<AskForAttendance> createState() => _AskForAttendanceState();
}

class _AskForAttendanceState extends State<AskForAttendance> {
  PeriodAttendanceBloc get _bloc => context.read<PeriodAttendanceBloc>();
  PeriodTypeBloc get _periodTypeBloc => context.read<PeriodTypeBloc>();

  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final labels = ["ពេញមួយថ្ងៃ", "ពេលព្រឹក", "ពេលរសៀល"];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        title: const Text('ស្នើសុំច្បាប់'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ប្រភេទច្បាប់',
                style: AppTextStyle.instance.medium,
              ),
              Row(
                children: [
                  _attendance(0, 'ច្បាប់ប្រចាំឆ្នាំ', 12),
                  _attendance(1, 'ច្បាប់ឈឺ', 6),
                  _attendance(2, 'ច្បាប់ពិសេស', 12),
                ],
              ),
              Text(
                'កាលបរិច្ឆេទ',
                style: AppTextStyle.instance.medium,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 270,
                width: double.infinity,
                decoration: AppDecoration.instance.defaultBoxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'ពីថ្ងៃ',
                        style: AppTextStyle.instance.medium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcon.instance.calendarStats,
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ថ្ងៃចន្ទ័ 25 មេសា 2024', // pass data in khmer here
                                  style: AppTextStyle.instance.medium,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.utc(2030),
                                );
                              },
                              child: Text(
                                'ផ្លាស់ប្តូរ',
                                style: AppTextStyle.instance.medium.copyWith(
                                    color: const Color.fromRGBO(0, 92, 148, 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'ដល់',
                        style: AppTextStyle.instance.medium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcon.instance.calendarStats,
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ថ្ងៃចន្ទ័ 25 មេសា 2024',
                                  style: AppTextStyle.instance.medium,
                                ),
                              ],
                            ),
                            Text(
                              'ផ្លាស់ប្តូរ',
                              style: AppTextStyle.instance.medium.copyWith(
                                  color: const Color.fromRGBO(0, 92, 148, 1)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          _periodButton(0, labels),
                          const SizedBox(
                            width: 10,
                          ),
                          _periodButton(1, labels),
                          const SizedBox(
                            width: 10,
                          ),
                          _periodButton(2, labels),
                        ],
                      ),
                      const Divider(),
                      BlocBuilder<PeriodTypeBloc, PeriodTypeState>(
                        builder: (context, state) {
                          final labelsConvert = [
                            "1 ថ្ងៃ",
                            "1 ព្រឹក",
                            '1 ល្ងាច'
                          ];
                          final displayText = labelsConvert[state.currentIndex];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'រយៈពេល',
                                style: AppTextStyle.instance.medium,
                              ),
                              Text(
                                displayText,
                                style: AppTextStyle.instance.medium,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              HRTextField(
                controller: _reasonController,
                placeholderText: 'មូលហេតុ​​',
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              HRTextField(
                controller: _referenceController,
                placeholderText: 'លិខិតយោង',
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ConfirmAttendance(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 55,
                  decoration: AppDecoration.instance.defaultBoxDecoration
                      .copyWith(color: const Color.fromRGBO(0, 92, 148, 1)),
                  child: Center(
                    child: Text(
                      'ដាក់ស្នើសំណើ',
                      style: AppTextStyle.instance.bold
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _periodButton(int index, List<String> label) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _periodTypeBloc.add(PeriodTypeStarted(index: index));
        },
        child: BlocSelector<PeriodTypeBloc, PeriodTypeState, int>(
          selector: (state) {
            return state.currentIndex;
          },
          builder: (context, currentIndex) {
            final isActive = currentIndex == index;
            return Container(
              decoration: AppDecoration.instance.defaultBoxDecoration.copyWith(
                  color: isActive
                      ? const Color.fromRGBO(0, 92, 148, 1)
                      : Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    label[index],
                    style: AppTextStyle.instance.medium.copyWith(
                        color: isActive ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _attendance(int index, String title, int period) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _bloc.add(PeriodAttendanceStarted(index: index));
        },
        child: BlocBuilder<PeriodAttendanceBloc, PeriodAttendanceState>(
          builder: (context, state) {
            final isActive = state.currentIndex == index;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              decoration: AppDecoration.instance.defaultBoxDecoration.copyWith(
                color: isActive
                    ? const Color.fromRGBO(0, 92, 148, 1)
                    : Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.instance.medium.copyWith(
                          color: isActive ? Colors.white : Colors.black),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          '$period',
                          style: AppTextStyle.instance.bold.copyWith(
                            color: isActive ? Colors.white : Colors.black,
                            fontSize: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 5),
                          child: Text(
                            'ថ្ងៃ',
                            style: AppTextStyle.instance.bold.copyWith(
                              color: isActive ? Colors.white : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
