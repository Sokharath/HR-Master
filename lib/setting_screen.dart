import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_master/app_constant.dart';
import 'package:hr_master/hr_text_style.dart';
import 'package:hr_master/utils/app_image.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('កំណត់កម្មវិធី'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: AppDecoration.instance.defaultBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ការកំណត់',
                      style: AppTextStyle.instance.bold.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcon.instance.enLanguage,
                          height: 35,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'ប្តូរទៅភាសា English',
                          style: AppTextStyle.instance.medium
                              .copyWith(fontSize: 18),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcon.instance.hrNotification,
                              height: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'ប្តូរទៅភាសា English',
                              style: AppTextStyle.instance.medium
                                  .copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 170,
              decoration: AppDecoration.instance.defaultBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ទូទៅ',
                      style: AppTextStyle.instance.bold.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'គោលការណ៍ភាពឯកជន',
                          style: AppTextStyle.instance.medium
                              .copyWith(fontSize: 18),
                        ),
                        SvgPicture.asset(
                          AppIcon.instance.privacy,
                          height: 30,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'លក្ខខណ្ឌនៃការប្រើប្រាស់',
                          style: AppTextStyle.instance.medium
                              .copyWith(fontSize: 18),
                        ),
                        SvgPicture.asset(
                          AppIcon.instance.privacy,
                          height: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
