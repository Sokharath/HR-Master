import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/utils/app_constant.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final String icon;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
              AppConstant.instance.view.defaultButtonSize / 4),
        ),
        height: AppConstant.instance.view.defaultButtonSize + 10,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CircleAvatar(
                radius: 20,
                child: SvgPicture.asset(icon),
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTextButton extends StatelessWidget {
  const RoundedTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.buttonColor,
    this.labelColor,
    this.spaceStandard,
  });

  final String label;
  final void Function()? onPressed;
  final Color buttonColor;
  final Color? labelColor;
  final double? spaceStandard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
              AppConstant.instance.view.defaultButtonSize),
        ),
        height: AppConstant.instance.view.defaultButtonSize + 10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spaceStandard ?? 0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: labelColor ?? Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
