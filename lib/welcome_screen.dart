import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/utils/app_image.dart';
import 'package:hr_master/components/button/hr_button.dart';
import 'package:hr_master/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'ជ្រើសរើសភាសា',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 380,
                ),
                SvgPicture.asset(AppIcon.instance.welcomeLogo),
                RoundedTextButton(
                  label: 'ចាប់ផ្តើម',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                    );
                  },
                  buttonColor: const Color.fromRGBO(0, 92, 148, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
