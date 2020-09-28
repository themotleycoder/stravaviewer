import 'package:stravaviewer/stravalib/Models/activity.dart';

abstract class ActivitiesRepository {
  Future<List<SummaryActivity>> loadActivities(int lastSyncDate);
  Future<DetailedActivity> loadActivityDetail(int activityId);
  Future<List<PhotoActivity>> loadActivityPhotos(int activityId);
  Future saveActivities(List<SummaryActivity> activities);
}
