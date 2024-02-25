import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tobeto_mobil/api/bloc/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobil/api/bloc/auth_bloc/auth_state.dart';
import 'package:tobeto_mobil/api/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_mobil/api/bloc/calendar_bloc/calendar_event.dart';
import 'package:tobeto_mobil/api/bloc/calendar_bloc/calendar_state.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_bloc.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_state.dart';
import 'package:tobeto_mobil/constants/image_text.dart';
import 'package:tobeto_mobil/pages/calendar/calendar_drawer/calendar_drawer.dart';
import 'package:tobeto_mobil/models/calendar/event_data_source.dart';
import 'package:tobeto_mobil/pages/calendar/calendar_event/calendar_event_page.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    final calendarController = CalendarController();

    return Scaffold(
      appBar: AppBar(
        actions: buildAppBarActions(userState),
      ),
      drawer: CalendarDrawer(calendarController: calendarController),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state is CalendarStateInitialize || state is CalendarStateUpdated) {
            final auth = context.read<AuthBloc>().state as AuthStateLoggedIn;
            context.read<CalendarBloc>().add(
                  CalendarEventFetch(userId: auth.user.uid),
                );
          }
          if (state is CalendarStateFetched) {
            return SfCalendar(
              controller: calendarController,
              firstDayOfWeek: 1,
              showWeekNumber: true,
              showNavigationArrow: true,
              showDatePickerButton: true,
              initialSelectedDate: DateTime.now(),
              view: CalendarView.schedule,
              dataSource: EventDataSource(state.calendar.events!),
              weekNumberStyle: WeekNumberStyle(
                backgroundColor: Colors.grey.shade600,
              ),
              monthViewSettings: buildMonthViewSettings(),
              scheduleViewSettings: buildScheduleViewSettings(),
              scheduleViewMonthHeaderBuilder: (context, details) {
                return buildMonthViewHeader(details);
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CalendarEventPage(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  MonthViewSettings buildMonthViewSettings() {
    return const MonthViewSettings(
      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
    );
  }

  Widget buildMonthViewHeader(ScheduleViewMonthHeaderDetails details) {
    return Image.asset(
      monthMap[details.date.month]!,
      fit: BoxFit.cover,
    );
  }

  ScheduleViewSettings buildScheduleViewSettings() {
    return const ScheduleViewSettings(
      weekHeaderSettings: WeekHeaderSettings(
        weekTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> buildAppBarActions(UserState state) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      if (state is UserStateFetched)
        buildUserAvatar(state.userModel.imageUrl)
      else
        buildUserAvatar(null)
    ];
  }

  Widget buildUserAvatar(String? imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        child: imageUrl != null
            ? CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(imageUrl),
              )
            : const Icon(Icons.person, size: 36),
      ),
    );
  }
}
