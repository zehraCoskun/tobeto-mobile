import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              _onTabSelected(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      _selectedTabIndex == index
                          ? Colors.blue // Seçili buton rengi
                          : Colors.black,
                    ),
                  ),
                  onPressed: () {
                    _onTabSelected(index);
                  },
                  child: Text(Lists.values[index].toString()),
                ),
                Container(
                  height: 2.0,
                  width: 40.0, // Seçili buton altındaki çizgi uzunluğu
                  color: _selectedTabIndex == index
                      ? Colors.blue // Seçili buton altındaki çizgi rengi
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

enum Lists {
  basvurular,
  egitimler,
  duyuru,
  anket;

  @override
  String toString() {
    switch (this) {
      case Lists.basvurular:
        return "Başvurularım";
      case Lists.egitimler:
        return "Eğitimlerim";
      case Lists.duyuru:
        return "Duyuru ve Haberlerim";
      case Lists.anket:
        return "Anketlerim";
    }
  }
}
