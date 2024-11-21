import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_master/hr_text_style.dart';

import 'package:hr_master/utils/app_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppIcon.instance.cardBgTop,
                fit: BoxFit.fitHeight,
                height: 400,
              ),
              SvgPicture.asset(
                AppIcon.instance.cardBgBottom,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcon.instance.moiLogo,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcon.instance.moiLetter,
                        height: 40,
                      ),
                      Text(
                        'MINISTRY OF INTERIOR',
                        style: AppTextStyle.instance.bold
                            .copyWith(color: Colors.white, fontSize: 14.5),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset(AppIcon.instance.avatar),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Phorn Vannarith',
                    style: AppTextStyle.instance.bold,
                  ),
                  Text(
                    'អ្នកដឹកនាំអ្នករចនា',
                    style: AppTextStyle.instance.medium,
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: QrImageView(data: 'Phorn Vannarith'),
              ),
              Text(
                'Power by OMS',
                style: AppTextStyle.instance.medium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
