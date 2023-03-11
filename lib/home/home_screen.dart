import 'package:flutter/material.dart';
import 'package:islami_ashor/home/quran/quran_tab.dart';
import 'package:islami_ashor/home/radio_tab.dart';
import 'package:islami_ashor/home/sebha_tab.dart';
import 'package:islami_ashor/home/setting/setting_tab.dart';

import 'package:provider/provider.dart';

import '../my_theme_data.dart';
import '../settingprovider/providersetting.dart';
import 'hadeth/hadeth_tab.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    const RadioTab(),
    const SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.cuurrenttheme == ThemeMode.light
                ? 'assets/images/default_bg.png'
                : 'assets/images/dark_bg.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('sc'
            //AppLocalizations.of(context)!.islami,
          //  style: Theme.of(context).textTheme.headline1,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                    size: 40,
                  ),
                  backgroundColor: provider.cuurrenttheme == ThemeMode.light
                      ? MyThemeData.secondaryColor
                      : MyThemeData.primaryColorDark,
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/icon_hadeth.png',
                    ),
                    size: 40,
                  ),
                  backgroundColor: provider.cuurrenttheme == ThemeMode.light
                      ? MyThemeData.secondaryColor
                      : MyThemeData.primaryColorDark,
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/icon_sebha.png',
                    ),
                    size: 40,
                  ),
                  backgroundColor: provider.cuurrenttheme == ThemeMode.light
                      ? MyThemeData.secondaryColor
                      : MyThemeData.primaryColorDark,
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/icon_radio.png',
                    ),
                    size: 40,
                  ),
                  backgroundColor: provider.cuurrenttheme == ThemeMode.light
                      ? MyThemeData.secondaryColor
                      : MyThemeData.primaryColorDark,
                  label: 'radio'),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(
                    'assets/images/setting_logoo.png',
                  ),
                  size: 32,
                ),
                backgroundColor: provider.cuurrenttheme == ThemeMode.light
                    ? MyThemeData.secondaryColor
                    : MyThemeData.primaryColorDark,
               // label: AppLocalizations.of(context)!.setting,
              ),
            ]),
        body: tabs[currentIndex],
      ),
    );
  }
}
