import 'package:flutter/material.dart';
import 'package:tobeto_mobil/core/widgets/basic_shadow.dart';
import 'package:tobeto_mobil/models/firebase_models/education_model.dart';
import 'package:tobeto_mobil/pages/home_tabbar_pages/main_view.dart/widgets/main_page_container.dart';
import 'package:tobeto_mobil/pages/home_tabbar_pages/main_view.dart/widgets/main_page_pin_container.dart';
import 'package:tobeto_mobil/utils/theme/theme_ios.dart';

class MainPageContent extends StatelessWidget {
  const MainPageContent({
    super.key,
    this.educationModel,
    this.title,
    this.imageUrl,
    required this.icon,
  });
  final EducationModel? educationModel;
  final String? title;
  final String? imageUrl;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        MainPageContainer(
          widget: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [basicShadow()],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    educationModel?.thumbnail ?? imageUrl!,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    educationModel?.title ?? title!,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
        MainPagePinContainer(
            widget: Icon(
          icon,
          color: TobetoDarkColors.mor,
          size: 32,
        )),
      ],
    );
  }
}