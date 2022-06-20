import '../export/competiton.dart';

class CompetitionServiceImpl implements CompetitionService {
  String baseUrl = "https://www.scorebat.com/api/competition/";

  @override
  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _repository.getCompetitions(baseUrl);
  }

  static CompetitionServiceImpl? _instance;
  static late CompetitionRepository _repository;

  CompetitionServiceImpl._({required CompetitionRepository repository}) {
    Developer.logInstance(this);
  }

  static CompetitionServiceImpl get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory CompetitionServiceImpl.init({required CompetitionRepository repository, bool singleton = true}) {
    _repository = repository;

    if (singleton) {
      _instance ??= CompetitionServiceImpl._(repository: repository);
      return _instance!;
    } else {
      _instance = CompetitionServiceImpl._(repository: repository);
      return _instance!;
    }
  }
}
