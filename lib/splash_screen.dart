import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/bloc/location.bloc/location_bloc.dart';
import 'package:hr_master/choose_language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestLocationPermission(); // Call the permission request
    });
  }

  void _requestLocationPermission() {
    BlocProvider.of<LocationBloc>(context).add(RequestLocationPermission());
    BlocProvider.of<LocationBloc>(context).stream.listen((state) {
      if (state is LocationPermissionGranted ||
          state is LocationPermissionDenied) {
        _navigateToNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(0, 92, 148, 1)
                    ],
                    begin: Alignment.topLeft,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcon.instance.hrLogo),
                    const Text(
                      'OMS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                AppIcon.instance.hrSplashScreenLogo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nextPage() {
    return const ChooseLanguage();
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        pageBuilder: ((context, animation, secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Opacity(
                opacity: animation.value,
                child: nextPage(),
              );
            },
          );
        }),
      ),
    );
  }
}
