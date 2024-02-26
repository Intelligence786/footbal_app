import 'dart:async';

import 'package:footbal_app/data/models/match_models/club_model.dart';
import 'package:footbal_app/data/models/match_models/league_model.dart';

class MatchModel {
  final LeagueModel? league;
  final DateTime? matchStartDateTime;
  final ClubModel firstClub;
  final ClubModel secondClub;

  final Timer matchTime;
  final int firstClubScore;
  final int secondClubScore;

  MatchModel(
      {required this.league,
      required this.matchStartDateTime,
      required this.firstClub,
      required this.secondClub,
      required this.matchTime,
      required this.firstClubScore,
      required this.secondClubScore});
}
