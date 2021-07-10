
import 'package:kiwi/kiwi.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

KiwiContainer container = KiwiContainer();

/// register IoC instances
void setupIocContainer() {
  container.registerSingleton((KiwiContainer container) => LaunchUrlService());
}
