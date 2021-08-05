
import 'package:kiwi/kiwi.dart';
import 'package:mobile_app_engineer/globals/Rating/rating_color.dart';
import 'package:mobile_app_engineer/globals/Rating/rating_title.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

KiwiContainer container = KiwiContainer();

/// register IoC instances
void setupIocContainer() {
  container.registerSingleton((KiwiContainer container) => LaunchUrlService());
  container.registerSingleton((KiwiContainer container) => RatingColor());
  container.registerSingleton((KiwiContainer container) => RatingTitle());

}
