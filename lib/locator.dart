import 'package:diary_demo_app/infrastructure/firebase_config.dart';
import 'package:diary_demo_app/infrastructure/firebase_repository.dart';
import 'package:diary_demo_app/service/life_balance_wheel_service.dart';
import 'package:diary_demo_app/service/weekly_goal_review_factory.dart';
import 'package:get_it/get_it.dart';

// https://pub.dev/packages/get_it

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerSingleton(FirebaseConfig.fireStore());
  locator.registerSingleton(WeeklyGoalReviewFactory());
  locator.registerSingleton(FirebaseRepository());
  locator.registerSingleton(LifeBalanceWheelService());
}
