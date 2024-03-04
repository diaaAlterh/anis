import 'package:anis/features/home/data/models/company_info_model.dart';
import 'package:anis/features/home/logic/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_widget.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompanyInfoModel>(
        stream: homeBloc.companyInfoStream,
        builder: (context, snapshot) {
          final info = snapshot.data?.results?.first;
          return AnimatedContainer(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                AboutWidget(
                  svgImage: 'assets/images/address.svg',
                  title: info?.city ?? '',
                  description: info?.address ?? '',
                ),
                AboutWidget(
                  svgImage: 'assets/images/phone.svg',
                  title: info?.mobilePhoneNumber ?? '',
                  description: info?.landLineNumber ?? '',
                  onTitlePressed: () async {
                    await launchUrl(
                        Uri.parse("tel:${info?.mobilePhoneNumber ?? ''}"));
                  },
                  onDescriptionPressed: () async {
                    await launchUrl(
                        Uri.parse("tel:${info?.landLineNumber ?? ''}"));
                  },
                ),
                AboutWidget(
                  svgImage: 'assets/images/calendar.svg',
                  title: info?.workingDays ?? '',
                  description: info?.workingHours ?? '',
                ),
              ],
            ),
          );
        });
  }
}
