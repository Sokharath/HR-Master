import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/bloc/location.bloc/location_bloc.dart';
import 'package:hr_master/bloc/tabbar_navigation.bloc/tabbar_navigation_bloc.dart';

import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/scanner_screen.dart';
import 'package:hr_master/tabbar_navigation.dart';
import 'package:hr_master/utils/app_image.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 92, 148, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            begin: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    SvgPicture.asset(AppIcon.instance.hrLogo),
                    Text(
                      'ដំណើរការបើកគណនី',
                      style: AppTextStyle.instance.bold.copyWith(fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: Text(
                        'សូមស្វាគមន៍! សូមធ្វើការស្គេនឃួរអកូត​ សំរាប់ចូលទៅកាន់ចូលទៅកាន់ប្រព័ន្ធ',
                        style: AppTextStyle.instance.regular
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcon.instance.hrLoginLogo,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 92, 148, 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'បើកដំណើរការគណនី',
                            style: AppTextStyle.instance.medium
                                .copyWith(color: Colors.white, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) => LocationBloc()
                                          ..add(RequestLocationPermission()),
                                      ),
                                      BlocProvider(
                                        create: (context) =>
                                            TabbarNavigationBloc(),
                                      ),
                                    ],
                                    child: const TabbarNavigation(),
                                  ),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => const ScannerScreen(),
                              //   ),
                              // );
                            },
                            child: SvgPicture.asset(
                              AppIcon.instance.hrScanner,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 135,
                        vertical: 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromRGBO(0, 39, 61, 1),
                      ),
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'ប្តូរភាសា',
                              style: AppTextStyle.instance.medium
                                  .copyWith(color: Colors.white, fontSize: 18),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: VerticalDivider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            CircleAvatar(
                              radius: 14,
                              child: SvgPicture.asset(
                                AppIcon.instance.enLanguage,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
