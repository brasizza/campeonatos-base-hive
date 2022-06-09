import '../models/competition_model.dart';
import '../models/country_model.dart';

abstract class CompetitionService {
  Future<Map<Country, List<Competition>>?> getCompetitions();
}