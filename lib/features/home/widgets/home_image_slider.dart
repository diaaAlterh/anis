import 'package:anis/core/widgets/title_widget.dart';
import 'package:anis/features/home/logic/home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeImageSlider extends StatelessWidget {
  const HomeImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: homeBloc.sliderStream,
        builder: (context, snapshot) {
          final data = snapshot.data?.results ?? [];
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (snapshot.hasData)
                  CarouselSlider.builder(
                    itemCount: data.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) =>
                            Image.network(
                      data[index].image?.url ?? '',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height-150,
                      initialPage: 0,
                      aspectRatio: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleWidget(title: "anis".tr()),
                      SelectableText(
                        'what_we_do'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
