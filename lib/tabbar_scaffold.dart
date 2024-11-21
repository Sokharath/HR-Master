import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/tabs.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hr_master/base_tabbar.dart';

import 'all_attendance.dart';

class TabbarScaffold extends BaseTabBarPageStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabbarScaffold();
  }
}

class _TabbarScaffold extends BaseTabBarStatefulWidgetState {
  @override
  List<Widget> get tabBarViews => [
        const AllAttendance(),
        Container(),
        Container(),
      ];

  @override
  List<Tab> get tabs => [
        Tab(
          text: 'ទាំងអស់',
        ),
        Tab(
          text: 'កំពុងរង់ចាំ',
        ),
        Tab(
          text: 'ប្រវត្តិរក្សាទុក',
        )
      ];
}
