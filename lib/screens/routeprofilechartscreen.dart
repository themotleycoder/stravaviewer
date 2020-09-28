import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stravaviewer/models/ActivityDetailDataModel.dart';
import 'package:stravaviewer/utils/conversions.dart';
import 'package:stravaviewer/models/StreamsDataModel.dart';
import 'package:stravaviewer/screens/ridedetailscreen.dart';
import 'package:stravaviewer/stravalib/API/streams.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:stravaviewer/widgets/ListItemViews.dart';

import '../appkeys.dart';

class RouteProfileChartScreen extends StatefulWidget {
  RouteProfileChartScreen();

  @override
  _RouteProfileChartScreenState createState() =>
      _RouteProfileChartScreenState();
}

class _RouteProfileChartScreenState extends State<RouteProfileChartScreen> {
  List<charts.Series<DistanceValue, double>> _chartData = [];
  StreamsDetailCollection _streamsDetail;
  CombinedStreams selectionModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<StreamsDataModel>(builder: (context, myModel, child) {
      _streamsDetail = myModel.combinedStreams == null
          ? new StreamsDetailCollection()
          : myModel.combinedStreams;
      _chartData = createDataSet(myModel);
      return Selector<StreamsDataModel, bool>(
          selector: (context, model) => model.isLoading,
          builder: (context, isLoading, _) {
            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  key: AppKeys.activitiesLoading,
                ),
              );
            }
            return Column(children: [
              Container(
                  height: 200.0,
                  padding: EdgeInsets.all(8.0),
                  child: charts.LineChart(
                    _chartData,
                    customSeriesRenderers: [
                      new charts.LineRendererConfig(
                          // ID used to link series to this renderer.
                          customRendererId: 'customArea',
                          includeArea: true,
                          stacked: true),
                      new charts.LineRendererConfig(
                          // ID used to link series to this renderer.
                          customRendererId: 'customArea2',
                          includeArea: false,
                          stacked: true),
                    ],
                    defaultRenderer:
                        new charts.LineRendererConfig(includeArea: false),
                    animate: true,
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec:
                            new charts.StaticNumericTickProviderSpec(
                      // Create the ticks to be used the domain axis.
                      <charts.TickSpec<num>>[
                        new charts.TickSpec(0, label: ''),
                        new charts.TickSpec(1, label: ''),
                        new charts.TickSpec(2, label: ''),
                        new charts.TickSpec(3, label: ''),
                        new charts.TickSpec(4, label: ''),
                      ],
                    )),
                    disjointMeasureAxes:
                        new LinkedHashMap<String, charts.NumericAxisSpec>.from({
                      'axis 1': new charts.NumericAxisSpec(),
                      'axis 2': new charts.NumericAxisSpec(),
                      'axis 3': new charts.NumericAxisSpec(),
                      'axis 4': new charts.NumericAxisSpec(),
                    }),
                    selectionModels: [
                      new charts.SelectionModelConfig(
                        type: charts.SelectionModelType.info,
                        changedListener: _onSelectionChanged,
                      )
                    ],
                    behaviors: [
                      // new charts.InitialSelection(selectedDataConfig: [
                      // new charts.SeriesDatumConfig<String>('Elevation', '0')
                      // ])
                      new charts.LinePointHighlighter(
                          showHorizontalFollowLine:
                              charts.LinePointHighlighterFollowLineType.none,
                          showVerticalFollowLine: charts
                              .LinePointHighlighterFollowLineType.nearest),
                      new charts.SelectNearest(
                          eventTrigger: charts.SelectionTrigger.tapAndDrag)
                    ],
                  )),
              ProfileDataView()
            ]);
          });
    });
  }

  _onSelectionChanged(charts.SelectionModel model) {
    int selection = model.selectedDatum[0].index;
    CombinedStreams stream = _streamsDetail.stream[selection];
    // Provider.of<StreamsDataModel>(context, listen: false)
    //     .setSelectedSeries(stream);
    Provider.of<ActivitySelectDataModel>(context, listen: false)
        .setSelectedSeries(stream);
  }

  List<charts.Series<DistanceValue, double>> createDataSet(
      StreamsDataModel streamsDetail) {
    final List<DistanceValue> elevationData = [];
    final List<DistanceValue> heartrateData = [];
    final List<DistanceValue> wattsData = [];
    final List<DistanceValue> cadenceData = [];
    final List<DistanceValue> gradeData = [];
    // SegmentEffort segment;
    double distance = 0.0;
    CombinedStreams col;
    final int length = _streamsDetail?.stream?.length ?? 0;
    for (int x = 0; x < length; x++) {
      col = _streamsDetail.stream[x];
      distance = col.distance;
      elevationData.add(new DistanceValue(distance, col.altitude));
      heartrateData.add(new DistanceValue(distance, col.heartrate.toDouble()));
      wattsData.add(new DistanceValue(distance, col.watts.toDouble()));
      cadenceData.add(new DistanceValue(distance, col.cadence.toDouble()));
      gradeData.add(new DistanceValue(distance, col.gradeSmooth.toDouble()));
    }

    return [
      new charts.Series<DistanceValue, double>(
        id: 'Elevation',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.MaterialPalette.gray.shade300,
        // areaColorFn specifies that the area skirt will be light blue.
        areaColorFn: (_, __) => charts.MaterialPalette.gray.shade300,
        domainFn: (DistanceValue elevation, _) => elevation.distance,
        measureFn: (DistanceValue elevation, _) => elevation.value,
        data: elevationData,
      )..setAttribute(charts.rendererIdKey, 'customArea'),
      new charts.Series<DistanceValue, double>(
        id: 'Heartrate',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        // areaColorFn specifies that the area skirt will be light blue.
        domainFn: (DistanceValue heartrate, _) => heartrate.distance,
        measureFn: (DistanceValue heartrate, _) => heartrate.value,
        data: heartrateData,
      )..setAttribute(charts.rendererIdKey, 'customArea2'),
      // new charts.Series<DistanceValue, double>(
      //   id: 'Watts',
      //   // colorFn specifies that the line will be blue.
      //   colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      //   // areaColorFn specifies that the area skirt will be light blue.
      //   domainFn: (DistanceValue watts, _) => watts.distance,
      //   measureFn: (DistanceValue watts, _) => watts.value,
      //   data: wattsData,
      // )..setAttribute(charts.rendererIdKey, 'customArea2'),
      new charts.Series<DistanceValue, double>(
        id: 'Cadence',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        // areaColorFn specifies that the area skirt will be light blue.
        domainFn: (DistanceValue cadence, _) => cadence.distance,
        measureFn: (DistanceValue cadence, _) => cadence.value,
        data: cadenceData,
      )..setAttribute(charts.rendererIdKey, 'customArea2'),
    ];
  }
}

class ProfileDataView extends StatefulWidget {
  @override
  _ProfileDataViewState createState() => _ProfileDataViewState();
}

class _ProfileDataViewState extends State<ProfileDataView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivitySelectDataModel>(
        builder: (context, myModel, child) {
      CombinedStreams selectedSeries = myModel.selectedStream;
      Map<String, String> units = Conversions.units(context);
      return Expanded(
        flex: 1,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: MediaQuery.of(context).size.height / 300,
          crossAxisCount: 2,
          children: <Widget>[
            gridViewItem(
                '',
                'Distance',
                Conversions.metersToDistance(
                        context, selectedSeries?.distance ?? 0)
                    .toStringAsFixed(2),
                units['distance']),
            gridViewItem(
                '',
                'Elevation',
                Conversions.metersToHeight(
                        context, selectedSeries?.altitude ?? 0)
                    .toStringAsFixed(0),
                units['height']),
            gridViewItem('', 'Heartrate',
                (selectedSeries?.heartrate ?? 0).toString(), 'bpm'),
            gridViewItem(
                '', 'Power', (selectedSeries?.watts ?? 0).toString(), 'w'),
            gridViewItem('', 'Cadence',
                (selectedSeries?.cadence ?? 0).toString() ?? "0", 'rpm'),
            gridViewItem('', 'Grade',
                (selectedSeries?.gradeSmooth ?? 0).toString() ?? "0", '%'),
          ],
        ),
      );
    });
  }
}
