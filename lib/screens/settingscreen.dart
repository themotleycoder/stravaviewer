import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stravaviewer/appkeys.dart';
import 'package:stravaviewer/models/ConfigDataModel.dart';
import 'package:stravaviewer/utils/repository/filerepository.dart';
import 'package:stravaviewer/utils/constants.dart' as Constants;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ConfigData _configData;

  @override
  void initState() {
    super.initState();
    _configData =
        Provider.of<ConfigDataModel>(context, listen: false).configData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(children: [
          createCard(
            'Metric',
            Switch(
              value: _configData.isMetric,
              onChanged: (value) {
                setState(() {
                  _configData.isMetric = value;
                  print(_configData.isMetric);
                });
                Provider.of<ConfigDataModel>(context, listen: false)
                    .configData = _configData;
              },
              activeTrackColor: Colors.lightBlueAccent,
              activeColor: Colors.blue,
            ),
          ),
          createCard(
              'Refresh Route Data',
              IconButton(
                  key: AppKeys.refreshButton,
                  tooltip: 'refresh',
                  icon: Icon(Icons.refresh),
                  color: Colors.blue,
                  onPressed: () => refreshRouteData())),
          createCard(
              'Refresh Calendar Data',
              IconButton(
                  key: AppKeys.refreshButton,
                  tooltip: 'refresh',
                  icon: Icon(Icons.refresh),
                  color: Colors.blue,
                  onPressed: () => refreshCalendarData())),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }

  refreshRouteData() {
    new FileRepository().scrapeRouteData();
  }

  refreshCalendarData() {
    new FileRepository().scrapeWorldCalendarData();
  }

  Card createCard(String label, Widget widget) {
    return Card(
        elevation: 0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            child: Text(label, style: Constants.headerTextStyle),
            margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
          widget
        ]));
  }
}
