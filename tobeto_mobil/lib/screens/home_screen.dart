import 'package:flutter/material.dart';
import 'package:tobeto_mobil/consts/constants.dart';
import 'package:tobeto_mobil/core/screens/global_scaffold.dart';
import 'package:tobeto_mobil/utils/responsive/responsive_layout.dart';
import 'package:tobeto_mobil/widgets/tab_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//393 width
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveLayout(
                mobileBody: HomeHeaderWidget(),
                tabletBody: HomeHeaderWidget(),
                desktopBody: HomeHeaderWidget()),
            ResponsiveLayout(
                mobileBody: HomeBodyWidget(),
                tabletBody: HomeBodyWidget(),
                desktopBody: HomeBodyWidget()),
            //ResponsiveLayout(mobileBody: mobileBody, tabletBody: , desktopBody: desktopBody),
            const TabBarWidget(),

            //en alt kısım
          ],
        ),
      ),
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
                text: headerTobeto,
                style: Theme.of(context).textTheme.headlineMedium,
                children: [
                  TextSpan(
                      text: headerTitle,
                      style: Theme.of(context).textTheme.headlineSmall),
                ]),
          ),
          Text(
            "Zehra",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 32, bottom: 24, left: 16, right: 16),
            alignment: Alignment.center,
            child: const Text(
              tobetoSlogan,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/ik-logo-dark.7938c0de.png",
            width: 200, //320 x 160
            height: 80,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              children: [
                const Text(
                  slogan2,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text.rich(
                    TextSpan(
                        text: "Aradığın ",
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                              text: "“", style: TextStyle(color: Colors.green)),
                          TextSpan(
                              text: "İş",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "“", style: TextStyle(color: Colors.green)),
                          TextSpan(
                              text: " Burada !",
                              style: TextStyle(color: Colors.black)),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
/*Center(child: Text('Başvurularım içeriği')),
                Center(child: Text('Eğitimlerim içeriği')),
                Center(child: Text('Duyuru ve Haberlerim içeriği')),
                Center(child: Text('Anketlerim içeriği')),*/