import '../../../core/log/developer_log.dart';
import '../../../data/models/championship_model.dart';
import '../../../data/models/competition_model.dart';
import '../../../data/services/championship/championship_service.dart';

class MatchesController {
  late ChampionshipService _service;

  static MatchesController? _instance;

  Competition? _competition;
  set competition(Competition? competition) => _competition = competition;
  Competition? get competition => _competition;
  MatchesController._({required ChampionshipService service}) {
    _service = service;
    Developer.logInstance(this);
  }

  static MatchesController get instance => _instance!;

  factory MatchesController.init({required ChampionshipService service}) {
    _instance ??= MatchesController._(service: service);
    return _instance!;
  }

  Future<Championship?> getScore({bool refresh = false}) async {
    return await _service.getScore(_competition?.link ?? '', refresh: refresh);
    // return championship;
  }
}
