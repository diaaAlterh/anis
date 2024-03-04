import 'package:anis/features/home/logic/home_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/animated_text.dart';

class AppBarWidget extends StatelessWidget {
  final List<Widget> children;
  const AppBarWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: homeBloc.scrollOffsetController.stream,
        builder: (context, snapshot) {
          return Container(
            height: 110,
            alignment: Alignment.center,
            child: AnimatedContainer(
              width: (snapshot.data ?? 0) > 10
                  ? MediaQuery.of(context).size.width * 0.95
                  : MediaQuery.of(context).size.width,
              height: (snapshot.data ?? 0) > 10 ? 90 : 110,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    (snapshot.data ?? 0) > 10 ? 20 : 0,
                  ),
                  color: (snapshot.data ?? 0) > 10
                      ? Theme.of(context).cardColor
                      : Theme.of(context).cardColor.withOpacity(0.3)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  if (MediaQuery.of(context).size.width > 500)
                    AnimatedContainer(
                        height: (snapshot.data ?? 0) > 10 ? 60 : 85,
                        width: (snapshot.data ?? 0) > 10 ? 60 : 85,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset('assets/images/logo.jpg')),
                  const SizedBox(
                    width: 20,
                  ),
                  AnimatedText(
                    'anis'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  if (MediaQuery.of(context).size.width > 1000)
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: children,
                        ))
                  else
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}
