import 'package:anis/features/home/logic/home_bloc.dart';
import 'package:anis/features/home/widgets/app_bar_widget.dart';
import 'package:anis/features/home/widgets/footer.dart';
import 'package:anis/features/home/widgets/home_image_slider.dart';
import 'package:anis/features/home/widgets/map_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    homeBloc.getSlider();
    homeBloc.getCompanyInfo();
    scrollController.addListener(() {
      homeBloc.scrollOffsetController.sink.add(scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).cardColor,
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              width: width,
            ),
            const SizedBox(height: 20),
            ...navigationButtons()
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    const HomeImageSlider(),
                    const MapWidget(),
                    if (width < 650) const Footer()
                  ],
                ),
              ),
              if (width > 650) const Footer()
            ],
          ),
          AppBarWidget(children: navigationButtons()),
        ],
      ),
    );
  }

  List<Widget> navigationButtons() {
    return [
      ElevatedButton(
        onPressed: () {},
        child: Text('our_products'.tr()),
      ),
      const SizedBox(height: 20, width: 20),
      ElevatedButton(
        onPressed: () {},
        child: Text('our_services'.tr()),
      ),
      const SizedBox(height: 20, width: 20),
      ElevatedButton(
        onPressed: () {},
        child: Text('contact_us'.tr()),
      ),
      const SizedBox(height: 20, width: 20),
      ElevatedButton(
        onPressed: () {},
        child: Text('about_us'.tr()),
      ),
    ];
  }
}
