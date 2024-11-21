import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';

import 'package:hr_master/annoucement_screen.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/attendance_screen.dart';
import 'package:hr_master/bloc/check.bloc/check_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'bloc/location.bloc/location_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hasCheckedIn = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    int minutesLate = 0;
    int minutesLeftEarly = 0;
    DateTime? checkInTime;
    DateTime? checkOutTime;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc()..add(RequestLocationPermission()),
        ),
        BlocProvider(
          create: (context) => CheckBloc(),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 270,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 92, 148, 1)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppIcon.instance.moiLogo,
                                  height: 60,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcon.instance.moiLetter,
                                      width: 90,
                                    ),
                                    const Text(
                                      'MINISTRY OF INTERIOR',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 9,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                    AppIcon.instance.notificationIcon)
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Phorn Vannarith',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'អ្នកដឹកនាំអ្នករចនា',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ស្វែងយល់ពីខ្លួនអ្នក',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(47, 43, 61, 0.9),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              _infoCard(
                                'វត្តមាន',
                                AppIcon.instance.ownAttendance,
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AttendanceScreen(
                                        minutesLate: minutesLate,
                                        checkInTime: checkInTime,
                                        minutesLeftEarly: minutesLeftEarly,
                                        checkOutTime: checkOutTime,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Spacer(),
                              _infoCard(
                                'សេចក្តីជូនដំណឹង',
                                AppIcon.instance.info,
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AnnouncementScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, state) {
                      String statusMessage =
                          "Press the button to unlock at the correct location";
                      bool isWithinRadius = state is LocationWithinRadius;
                      Color outerColor = isWithinRadius
                          ? const Color.fromRGBO(0, 64, 103, 1)
                          : const Color.fromRGBO(223, 222, 224, 1);
                      if (state is LocationPermissionGranted) {
                        statusMessage = state.statusMessage;
                      } else if (state is LocationPermissionDenied) {
                        statusMessage = state.statusMessage;
                      } else if (state is LocationOutsideRadius) {
                        statusMessage = state.statusMessage;
                      } else if (state is LocationError) {
                        statusMessage = state.errorMessage;
                      }
                      return Column(
                        children: [
                          if (state is LocationPermissionDenied ||
                              state is LocationOutsideRadius)
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: state is LocationOutsideRadius
                                    ? const Color.fromRGBO(0, 109, 209, 0.16)
                                    : const Color.fromRGBO(255, 159, 67, 0.16),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                AppIcon.instance.hrAlert),
                                            const SizedBox(width: 10),
                                            Text(
                                              state is LocationOutsideRadius
                                                  ? 'បញ្ជាក់'
                                                  : 'តម្រូវការប្រព័ន្ធ',
                                              style: AppTextStyle.instance.bold,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: 220,
                                          child: Text(
                                            'សូមបើកសេវាកំណត់ទីតាំង ដើម្បីប្រើប្រាស់មុខងារ (ចុះវត្តមាន),',
                                            style: AppTextStyle.instance.medium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Permission.location;
                                        context
                                            .read<LocationBloc>()
                                            .add(RequestLocationPermission());
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          color: state is LocationOutsideRadius
                                              ? const Color.fromRGBO(
                                                  0, 64, 103, 1)
                                              : const Color.fromRGBO(
                                                  255, 159, 67, 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(state
                                                      is LocationOutsideRadius
                                                  ? AppIcon.instance.refresh
                                                  : AppIcon.instance.hrShield),
                                              const SizedBox(width: 5),
                                              Text(
                                                'អនុញ្ញាតសេវា',
                                                style: AppTextStyle
                                                    .instance.medium
                                                    .copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          BlocBuilder<CheckBloc, CheckState>(
                            builder: (context, state) {
                              if (state is CheckInState && isWithinRadius) {
                                outerColor =
                                    const Color.fromRGBO(193, 97, 28, 1);
                              } else if (state is CheckOutState) {
                                outerColor =
                                    const Color.fromRGBO(0, 64, 103, 1);
                              } else if (state is LocationOutsideRadius) {
                                outerColor =
                                    const Color.fromRGBO(223, 222, 224, 1);
                              }
                              return SlideAction(
                                enabled: isWithinRadius,
                                reversed: false,
                                elevation: 0,
                                borderRadius: 10,
                                textColor: Colors.grey,
                                innerColor: Colors.white,
                                outerColor: outerColor,
                                onSubmit: isWithinRadius
                                    ? () {
                                        DateTime now = DateTime.now();
                                        DateTime officeStartTime = DateTime(
                                            now.year,
                                            now.month,
                                            now.day,
                                            8,
                                            30);
                                        DateTime officeEndTime = DateTime(
                                            now.year,
                                            now.month,
                                            now.day,
                                            19,
                                            0);
                                        if (state is CheckInitial ||
                                            state is CheckOutState) {
                                          context
                                              .read<CheckBloc>()
                                              .add(CheckInEvent());
                                          checkInTime = now;
                                          minutesLate = now
                                                  .isAfter(officeStartTime)
                                              ? now
                                                  .difference(officeStartTime)
                                                  .inMinutes
                                              : 0;
                                        } else if (state is CheckInState) {
                                          context
                                              .read<CheckBloc>()
                                              .add(CheckOutEvent());
                                          checkOutTime = now;
                                          minutesLeftEarly =
                                              now.isBefore(officeEndTime)
                                                  ? officeEndTime
                                                      .difference(now)
                                                      .inMinutes
                                                  : 0;
                                        }
                                        return null;
                                      }
                                    : null,
                                sliderButtonIcon: SvgPicture.asset(
                                  AppIcon.instance.arrowRight,
                                  width: 20,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 200),
                                  child: Text(
                                    state is CheckInitial ||
                                            state is CheckOutState
                                        ? "អូសដើម្បីចុះវត្តមាន"
                                        : "អូសដើម្បីចាកចេញ",
                                    style: TextStyle(
                                      color: isWithinRadius
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            _cardPositioned(),
          ],
        ),
      ),
    );
  }

  Positioned _cardPositioned() {
    return Positioned(
      top: 230,
      bottom: 480,
      left: 15,
      right: 15,
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    AppIcon.instance.attendanceCheck,
                    height: 40,
                  ),
                  const Text(
                    'ថ្ងៃច័ន្ទ .23-JUL-2024',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'ម៉ោងចូល',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(AppIcon.instance.check)
                        ],
                      ),
                      const Text(
                        '08:25 AM',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'ម៉ោងចូល',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(AppIcon.instance.check)
                        ],
                      ),
                      const Text(
                        '08:25 AM',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _infoCard(
      String name, String iconName, void Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 100,
        width: 190,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  iconName,
                  height: 60,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(47, 43, 61, 0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
