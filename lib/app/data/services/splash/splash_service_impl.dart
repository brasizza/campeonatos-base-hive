import './splash_service.dart';
import '../../../core/log/developer_log.dart';
import '../../repositories/splash_repository.dart';

class SplashServiceImpl implements SplashService {
  static SplashServiceImpl? _instance;
  static late SplashRepository _repository;

  SplashServiceImpl._({required SplashRepository repository}) {
    Developer.logInstance(this);
  }

  factory SplashServiceImpl.init({required SplashRepository repository, bool singleton = false}) {
    _repository = repository;
    if (singleton) {
      _instance ??= SplashServiceImpl._(repository: repository);
    } else {
      _instance = SplashServiceImpl._(repository: repository);
    }
    return _instance!;
  }

  static SplashServiceImpl get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  @override
  Future<void> populateCompetitions() async {
    await _repository.populateCompetitions();
  }
}
