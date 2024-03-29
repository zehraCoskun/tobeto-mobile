import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_bloc.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_state.dart';
import 'package:tobeto_mobil/core/widgets/background/secondary_background.dart';
import 'package:tobeto_mobil/pages/home/main_view/announcement/main_annoucement_view.dart';
import 'package:tobeto_mobil/pages/home/main_view/header/main_header_container.dart';
import 'package:tobeto_mobil/pages/home/main_view/teams/main_team_view.dart';
import 'package:tobeto_mobil/pages/home/main_view/tobeto_news/main_tobeto_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<UserBloc>().state as UserStateFetched;
    String fullName = state.userModel.fullName!;
    String firstName = fullName.split(' ')[0];

    return SecondaryBackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildHeader(firstName),
          buildBody(),
        ],
      ),
    );
  }

  Widget buildHeader(String firstName) {
    return MainHeaderContainer(firstName: firstName);
  }

  Flexible buildBody() {
    return const Flexible(
      flex: 6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTobetoList(),
            MainAnnouncementList(),
            MainTeamList(),
          ],
        ),
      ),
    );
  }
}

class MainBodyTitle extends StatelessWidget {
  const MainBodyTitle({
    super.key,
    required this.context,
    required this.title,
  });

  final BuildContext context;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
    );
  }
}
