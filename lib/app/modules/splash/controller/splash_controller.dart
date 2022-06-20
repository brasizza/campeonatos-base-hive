import '../../../core/log/developer_log.dart';
import '../../../data/repositories/rest/competition/competiton_export.dart';
import '../../../data/services/splash/splash_service.dart';

class SplashController {
  static SplashController? _instance;
  late SplashService _service;
  SplashController._({required SplashService service}) {
    _service = service;
    Developer.logInstance(this);
  }

  factory SplashController.init({required SplashService service}) {
    _instance ??= SplashController._(service: service);
    return _instance!;
  }

  Future<bool> getData() async {
    await _service.populateCompetitions();
    return true;
  }
}
