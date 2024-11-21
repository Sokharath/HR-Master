import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertInfo extends StatelessWidget {
  const AlertInfo({
    super.key,
    required this.title,
    required this.info,
    required this.alertIcon,
    required this.popOut,
    required this.popOutIcon,
    required this.onPressed,
    required this.infoColor,
    required this.popOutColor,
  });

  final String title;
  final String info;
  final String alertIcon;
  final String popOut;
  final String popOutIcon;
  final Color infoColor;
  final Color popOutColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: infoColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(alertIcon),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    info,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              margin: const EdgeInsets.only(left: 40),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: popOutColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      popOutIcon,
                    ),
                    Text(
                      popOut,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
