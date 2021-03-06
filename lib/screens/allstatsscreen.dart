import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zwiftdataviewer/models/ActivitiesDataModel.dart';
import 'package:zwiftdataviewer/stravalib/Models/activity.dart';
import 'package:zwiftdataviewer/utils/conversions.dart';
import 'package:zwiftdataviewer/utils/theme.dart';
import 'package:zwiftdataviewer/widgets/listitemviews.dart' as listItemViews;
import 'package:charts_flutter/flutter.dart' as charts;

class AllStatsScreen extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

  @override
  Widget build(BuildContext context) {
    Map<String, double> _summaryData;
    return Selector<ActivitiesDataModel, List<SummaryActivity>>(
        selector: (_, model) => model.dateFilteredActivities,
        builder: (context, _activities, _) {
          _summaryData = SummaryData.createSummaryData(_activities);
          Map<String, String> units = Conversions.units(context);
          final List<charts.Series> seriesList =
              generateChartData(context, units, _activities);

          return Container(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: charts.BarChart(
                    seriesList,
                    animate: true,
                    behaviors: [new charts.SeriesLegend()],
                    barGroupingType: charts.BarGroupingType.grouped,
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec:
                            new charts.BasicNumericTickProviderSpec(
                                desiredTickCount: 3)),
                    secondaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec:
                            new charts.BasicNumericTickProviderSpec(
                                desiredTickCount: 3)),
                  ),
                )),
                Container(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Column(
                    children: <Widget>[
                      listItemViews.tripleDataLineItem(
                          "Distance",
                          Icons.explore,
                          ["Total", "Avg", "Longest"],
                          [
                            Conversions.metersToDistance(context,
                                    _summaryData[StatsType.TotalDistance])
                                .toStringAsFixed(2),
                            Conversions.metersToDistance(context,
                                    _summaryData[StatsType.AvgDistance])
                                .toStringAsFixed(2),
                            Conversions.metersToDistance(context,
                                    _summaryData[StatsType.LongestDistance])
                                .toStringAsFixed(2)
                          ],
                          units["distance"]),
                      listItemViews.tripleDataLineItem(
                        "Elevation",
                        Icons.explore,
                        ["Total", "Avg", "Highest"],
                        [
                          Conversions.metersToHeight(context,
                                  _summaryData[StatsType.TotalElevation])
                              .toStringAsFixed(2),
                          Conversions.metersToHeight(
                                  context, _summaryData[StatsType.AvgElevation])
                              .toStringAsFixed(2),
                          Conversions.metersToHeight(context,
                                  _summaryData[StatsType.HighestElevation])
                              .toStringAsFixed(2)
                        ],
                        units['height'],
                      )
                    ],
                  ),
                )
              ]));
        });
  }

  List<charts.Series<YearlyTotals, String>> generateChartData(
      BuildContext context,
      Map<String, String> units,
      List<SummaryActivity> activities) {
    /// Create series list with multiple series
    final Map<String, double> distances = {};
    final Map<String, double> elevations = {};
    final String totalName = "Total";

    for (var activity in activities) {
      double distance =
          Conversions.metersToDistance(context, activity.distance);
      double elevation =
          Conversions.metersToHeight(context, activity.totalElevationGain);
      distances[totalName] = distances[totalName] == null
          ? distance
          : distances[totalName] += distance;
      elevations[totalName] = elevations[totalName] == null
          ? elevation
          : elevations[totalName] += elevation;
      if (distances.containsKey(activity.startDateLocal.year.toString())) {
        distance += distances[activity.startDateLocal.year.toString()];
        elevation += elevations[activity.startDateLocal.year.toString()];
      }
      distances[activity.startDateLocal.year.toString()] = distance;
      elevations[activity.startDateLocal.year.toString()] = elevation;
    }

    List<YearlyTotals> distanceData = [];
    for (String key in distances.keys) {
      distanceData.add(new YearlyTotals(key, distances[key]));
    }
    List<YearlyTotals> elevationData = [];
    for (String key in elevations.keys) {
      elevationData.add(new YearlyTotals(key, elevations[key]));
    }

    return [
      new charts.Series<YearlyTotals, String>(
        id: 'Distance (' + units['distance'] + ')',
        domainFn: (YearlyTotals totals, _) => totals.year,
        measureFn: (YearlyTotals totals, _) => totals.value,
        data: distanceData,
        seriesColor: charts.ColorUtil.fromDartColor(zdvOrange),
      ),
      new charts.Series<YearlyTotals, String>(
        id: 'Elevation (' + units['height'] + ')',
        domainFn: (YearlyTotals totals, _) => totals.year,
        measureFn: (YearlyTotals totals, _) => totals.value,
        data: elevationData,
        seriesColor: charts.ColorUtil.fromDartColor(zdvYellow),
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId)
    ];
  }
}

class YearlyTotals {
  final String year;
  final double value;

  YearlyTotals(this.year, this.value);
}

class StatsType {
  static const String TotalDistance = "TotalDistance";
  static const String AvgDistance = "AvgDistance";
  static const String TotalElevation = "TotalElevation";
  static const String AvgElevation = "AvgElevation";
  static const String LongestDistance = "LongestDistance";
  static const String HighestElevation = "HighestElevation";
}

class SummaryData {
  static Map<String, double> createSummaryData(
      List<SummaryActivity> activities) {
    Map<String, double> data = new Map<String, double>();
    double distance = 0.0;
    double elevation = 0.0;
    double longestDistance = 0.0;
    double highestElevation = 0.0;
    for (var activity in activities) {
      distance += activity.distance;
      elevation += activity.totalElevationGain;
      if (activity.distance > longestDistance) {
        longestDistance = activity.distance;
      }
      if (activity.totalElevationGain > highestElevation) {
        highestElevation = activity.totalElevationGain;
      }
    }
    data[StatsType.TotalDistance] = distance;
    data[StatsType.AvgDistance] = distance / activities.length;
    data[StatsType.TotalElevation] = elevation;
    data[StatsType.AvgElevation] = elevation / activities.length;
    data[StatsType.LongestDistance] = longestDistance;
    data[StatsType.HighestElevation] = highestElevation;

    return data;
  }
}
