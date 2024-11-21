import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/ask_for_attendance.dart';
import 'package:hr_master/utils/app_image.dart';

import 'bloc/bloc/period_type_bloc.dart';
import 'bloc/period_attendance.bloc/period_attendance_bloc.dart';

class AllAttendance extends StatelessWidget {
  const AllAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => PeriodAttendanceBloc(),
                  ),
                  BlocProvider(
                    create: (context) => PeriodTypeBloc(),
                  ),
                ],
                child: const AskForAttendance(),
              ),
            ),
          );
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromRGBO(0, 92, 148, 1),
          child: SvgPicture.asset(
            AppIcon.instance.plus,
          ),
        ),
      ),
    );
  }
}
