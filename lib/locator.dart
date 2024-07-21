import 'package:diary_demo_app/infrastructure/firebase_repository.dart';
import 'package:diary_demo_app/service/weekly_goal_review_factory.dart';
import 'package:get_it/get_it.dart';

// https://pub.dev/packages/get_it

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerSingleton(WeeklyGoalReviewFactory());
  locator.registerSingleton(FirebaseRepository());
}
