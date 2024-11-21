import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/bloc/late_time.bloc/late_time_bloc.dart';
import 'package:hr_master/bloc/tabbar_navigation.bloc/tabbar_navigation_bloc.dart';
import 'package:hr_master/bloc/location.bloc/location_bloc.dart';
import 'package:hr_master/components/button/hr_button.dart';
import 'package:hr_master/tabbar_navigation.dart';

import 'utils/textfield.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SvgPicture.asset(AppIcon.instance.welcomeLogo),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'បើកគណនីអោយដំណើរការ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    'ស្វាគមន៏ត្រលប់មកវិញ! សូមេត្តាធ្វើការបញ្ចូលពត៌មានសំរាប់ ចូលទៅកាន់ប្រពន្ធ័',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const HRTextField(
                    placeholderText: 'លេខ សំគាល់ខ្លួន',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const HRTextField(
                    placeholderText: 'លេខសម្ងាត់',
                  ),
                  const SizedBox(
                    height: 135,
                  ),
                  RoundedTextButton(
                    label: 'បើកដំណើរការ',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MultiBlocProvider(
                      //       providers: [
                      //         BlocProvider(
                      //           create: (context) => LocationBloc()
                      //             ..add(RequestLocationPermission()),
                      //         ),
                      //         BlocProvider(
                      //           create: (context) => LateTimeBloc(),
                      //         ),
                      //       ],
                      //       child: const TabbarNavigation(),
                      //     ),
                      //   ),
                      // );
                    },
                    buttonColor: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
