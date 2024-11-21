import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_master/utils/app_image.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('សេចក្តីជូនដំណឹង'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _resultAnnouncement(),
              const SizedBox(
                height: 20,
              ),
              _resultAnnouncement(),
            ],
          ),
        ),
      ),
    );
  }

  Container _resultAnnouncement() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                const Text(
                  '២៣-មេសា-២០២៤',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppIcon.instance.info,
                  height: 40,
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'ក្រុមហ៊ុនរបស់យើងនឹងឈប់សម្រាកចាប់ពីថ្ងៃទី 21 ខែមេសា ឆ្នាំ 2024 សម្រាប់ខួបកំណើតថៅកែ សម្រាប់បុគ្គលិកទាំងអស់ត្រូវឈប់សម្រាកសម្រាប់ថ្ងៃឈប់សម្រាក។',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
