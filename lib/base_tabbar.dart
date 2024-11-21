import 'package:flutter/material.dart';
import 'package:hr_master/hr_text_style.dart';

abstract class BaseTabBarPageStatefulWidget extends StatefulWidget {
  const BaseTabBarPageStatefulWidget({super.key});
}

abstract class BaseTabBarStatefulWidgetState
    extends State<BaseTabBarPageStatefulWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Tab> get tabs;
  List<Widget> get tabBarViews;
  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height - kToolbarHeight,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [appStyles.defaultToolBarBoxShadow],
                ),
                child: TabBar(
                  controller: _tabController,
                  tabs: tabs,
                  labelColor: const Color.fromRGBO(0, 92, 148, 7),
                  unselectedLabelColor: const Color.fromRGBO(47, 43, 61, 0.7),
                  labelStyle: AppTextStyle.instance.medium.copyWith(
                    fontSize: 16.0,
                    // letterSpacing: 0.6,
                  ),
                  indicatorColor: const Color.fromRGBO(0, 92, 148, 7),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1.5,
                ),
              ),
              const SizedBox(height: 16 / 2),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: tabBarViews,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
