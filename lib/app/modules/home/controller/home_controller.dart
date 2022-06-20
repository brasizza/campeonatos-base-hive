import '../../../core/log/developer_log.dart';
import '../../../data/models/competition_model.dart';
import '../../../data/models/country_model.dart';
import '../../../data/services/competition/competition_service.dart';

class HomeController {
  late CompetitionService _service;

  static HomeController? _instance;

  HomeController._({required CompetitionService service}) {
    _service = service;
    Developer.logInstance(this);
  }

  static HomeController get instance {
    if (_instance == null) {
      throw Exception();
    } else {
      return _instance!;
    }
  }

  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _service.getCompetitions();
  }

  factory HomeController.init({required CompetitionService service}) {
    _instance ??= HomeController._(service: service);
    return _instance!;
  }
}
