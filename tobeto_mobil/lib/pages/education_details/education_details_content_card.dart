import 'package:flutter/material.dart';
import 'package:tobeto_mobil/models/education/education_content_model.dart';

class EducationDetailsContentCard extends StatelessWidget {
  const EducationDetailsContentCard({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  final EducationContentModel content;
  final void Function(String url) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(content.url),
      child: Card(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: ListTile(
          title: Text(
            content.title,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
