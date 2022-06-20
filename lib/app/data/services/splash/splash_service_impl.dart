import './splash_service.dart';
import '../../../core/log/developer_log.dart';
import '../../repositories/splash_repository.dart';

class SplashServiceImpl implements SplashService {
  static SplashServiceImpl? _instance;
  late SplashRepository _repository;

  SplashServiceImpl._({required SplashRepository repository}) {
    _repository = repository;
    Developer.logInstance(this);
  }

  factory SplashServiceImpl.init({required SplashRepository repository}) {
    _instance ??= SplashServiceImpl._(repository: repository);
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
