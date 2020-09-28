import 'package:stravaviewer/stravalib/API/streams.dart';

abstract class StreamsRepository {
  Future<StreamsDetailCollection> loadStreams(int activityId);
}
