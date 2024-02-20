import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobil/api/bloc/team_bloc/team_event.dart';
import 'package:tobeto_mobil/api/bloc/team_bloc/team_state.dart';
import 'package:tobeto_mobil/api/business/services/team_service.dart';
import 'package:tobeto_mobil/models/firebase_models/team_model.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamService _teamService;
  TeamBloc(this._teamService) : super(const TeamStateInitial()) {
    on<TeamEventFetch>((event, emit) => _onFetchExams(event, emit));
  }

  Future<void> _onFetchExams(TeamEventFetch event, Emitter<TeamState> emit) async {
    emit(const TeamStateLoading(isLoading: false));
    try {
      final List<TeamModel> teams = await _teamService.getAllTeam();
      emit(TeamStateLoaded(teams));
    } catch (e) {
      emit(TeamStateError(errorMessage: e.toString()));
    }
  }
}