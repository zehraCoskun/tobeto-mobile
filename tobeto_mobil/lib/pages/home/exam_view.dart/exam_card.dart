import 'package:flutter/material.dart';
import 'package:tobeto_mobil/constants/pages/home_text.dart';
import 'package:tobeto_mobil/constants/sizes.dart';
import 'package:tobeto_mobil/models/exam_model.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({
    Key? key,
    required this.exam,
  }) : super(key: key);

  final ExamModel exam;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: padding16, vertical: padding16 / 2),
        padding: const EdgeInsets.symmetric(horizontal: padding16, vertical: padding16 / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).drawerTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildHeader(context),
            buildBody(context),
            buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Expanded(
      child: Text(
        exam.title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Text(exam.detail, style: Theme.of(context).textTheme.titleMedium);
  }

  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TimeIcon(),
        Text(
          exam.duration,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class TimeIcon extends StatelessWidget {
  const TimeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4),
      child: Icon(
        Icons.timer_outlined,
        color: logoYesil,
      ),
    );
  }
}
