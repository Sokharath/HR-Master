import 'package:hr_master/utils/app_image.dart';

class AttendanceInfo {
  final String icon;
  final String info;
  final String totalInfo;

  AttendanceInfo(
      {required this.icon, required this.info, required this.totalInfo});
}

List<AttendanceInfo> attenDance = [
  AttendanceInfo(
    icon: AppIcon.instance.hrInClock,
    info: 'វត្តមានសរុប',
    totalInfo: '12',
  ),
  AttendanceInfo(
    icon: AppIcon.instance.hrOutClock,
    info: 'ពិនិត្យចេញសរុប',
    totalInfo: '8',
  ),
  AttendanceInfo(
    icon: AppIcon.instance.hrOnTime,
    info: 'ចំនួនមកទៀងទាត់សរុប',
    totalInfo: '23',
  ),
  AttendanceInfo(
    icon: AppIcon.instance.hrLateClock,
    info: 'វត្តមានយឺតសរុប',
    totalInfo: '12',
  ),
  AttendanceInfo(
    icon: AppIcon.instance.hrTotalAttendance,
    info: 'អវត្តមានសរុប',
    totalInfo: '12',
  ),
  AttendanceInfo(
    icon: AppIcon.instance.hrTotalPuncActuality,
    info: 'ច្បាប់សរុប',
    totalInfo: '2',
  )
];

class AttendancePending {
  final String title;
  final String titleInfo;
  AttendancePending({required this.title, required this.titleInfo});
}

List<AttendancePending> pendingData = [
  AttendancePending(title: 'ប្រភេទច្បាប់ :', titleInfo: 'ច្បាប់ប្រចាំឆ្នាំ'),
  AttendancePending(
      title: 'កាលបរិច្ឆេទស្នើសុំ :', titleInfo: '១២ មេសា ២០២៤ - 12:00 ល្ងាច'),
  AttendancePending(title: 'រយៈពេល :', titleInfo: '៤ ម៉ោង'),
];
