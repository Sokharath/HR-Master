import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/application_screen.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/bloc/tabbar_navigation.bloc/tabbar_navigation_bloc.dart';
import 'package:hr_master/card_screen.dart';
import 'package:hr_master/home_screen.dart';

class TabbarNavigation extends StatefulWidget {
  const TabbarNavigation({super.key});

  @override
  State<TabbarNavigation> createState() => _TabbarNavigationState();
}

class _TabbarNavigationState extends State<TabbarNavigation> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  TabbarNavigationBloc get _bloc => context.read<TabbarNavigationBloc>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _bloc.add(TabbarNavigationStarted(_currentPageIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          _bloc.add(TabbarNavigationChangeRequested(index));
          _currentPageIndex = index;
          print(index);
        },
        children: [
          const HomeScreen(),
          Container(),
          const CardScreen(),
          const ApplicationScreen(),
        ],
      ),
      bottomNavigationBar:
          BlocSelector<TabbarNavigationBloc, TabbarNavigationState, int>(
        selector: (state) {
          return state.currentIndex;
        },
        builder: (BuildContext context, currentIndex) {
          return _buildBottomNavigationBar(currentIndex);
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(int currentIndex) {
    final textStyle = TextStyle(fontSize: 14);
    const unselectedColor = Colors.black;

    const selectedColor = Color.fromRGBO(0, 92, 148, 1);
    final iconPadding = EdgeInsets.symmetric(vertical: 5);

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: 'ទំព័រដើម',
        icon: Padding(
          padding: iconPadding,
          child: SvgPicture.asset(
            AppIcon.instance.hrHome,
            colorFilter: ColorFilter.mode(
                currentIndex == 0 ? selectedColor : unselectedColor,
                BlendMode.srcIn),
            // color: currentIndex == 0 ? selectedColor : unselectedColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'សុំច្បាប់',
        icon: Padding(
          padding: iconPadding,
          child: SvgPicture.asset(
            AppIcon.instance.hrGroup,
            color: currentIndex == 1 ? selectedColor : unselectedColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'ប័ណ្ណ',
        icon: Padding(
          padding: iconPadding,
          child: SvgPicture.asset(
            AppIcon.instance.hrCard,

            // ignore: deprecated_member_use
            color: currentIndex == 2 ? selectedColor : unselectedColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'កម្មវិធី',
        icon: Padding(
          padding: iconPadding,
          child: SvgPicture.asset(
            AppIcon.instance.hrApp,
            color: currentIndex == 3 ? selectedColor : unselectedColor,
          ),
        ),
      ),
    ];

    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: items,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: unselectedColor,
      selectedItemColor: selectedColor,
      unselectedLabelStyle: textStyle.copyWith(color: unselectedColor),
      selectedLabelStyle: textStyle.copyWith(color: selectedColor),
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        _selectPage(index);
      },
    );
  }

  void _selectPage(int index) {
    if (_currentPageIndex == index) {
      log("[] same index: $index");
    } else {
      _bloc.add(TabbarNavigationChangeRequested(index));
      _pageController.jumpToPage(index);
      _currentPageIndex = index;
    }
  }
}
