import 'package:flutter/material.dart';
import 'package:tobeto_mobil/core/widgets/shadows.dart';
import 'package:tobeto_mobil/models/tobeto_news_model.dart';

class MainTobetoCard extends StatelessWidget {
  const MainTobetoCard({super.key, required this.tobetoNewsModel});
  final TobetoNewsModel tobetoNewsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
        boxShadow: [
          containerBasicShadow(),
          containerBasicShadow(),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            tobetoNewsModel.imageUrl,
            height: 120,
            width: 120,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(tobetoNewsModel.content,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    wordSpacing: 1.5,
                    height: 1.5,
                    shadows: [
                      whiteTitleShadow(),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
