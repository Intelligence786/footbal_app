import 'package:footbal_app/data/models/match_models/club_model.dart';

class LeagueModel
{
  final String? name;

  final List<LeagueTeam> leagueTeamsList;

  LeagueModel({required this.name, required this.leagueTeamsList});
}

class LeagueTeam
{
  final ClubModel team;
  final int gamesCount;
  final String totalPoints;
  final int overall;

  LeagueTeam({required this.team, required this.gamesCount, required this.totalPoints, required this.overall});
}
