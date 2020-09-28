import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stravaviewer/models/ConfigDataModel.dart';
import 'package:stravaviewer/models/RouteDataModel.dart';
import 'package:stravaviewer/routes.dart';
import 'package:stravaviewer/screens/allstatsscreen.dart';
import 'package:stravaviewer/screens/calendarscreen.dart';
import 'package:stravaviewer/screens/homescreen.dart';
import 'package:stravaviewer/screens/settingscreen.dart';
import 'package:stravaviewer/utils/repository/filerepository.dart';
import 'package:stravaviewer/utils/theme.dart';

class ZwiftViewerApp extends StatelessWidget {
  final FileRepository configRepository;

  ZwiftViewerApp({
    @required this.configRepository,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<ConfigDataModel>(
        create: (context) =>
            ConfigDataModel(repository: FileRepository())..loadConfig(),
        child: ListenableProvider<RouteDataModel>(
            create: (context) =>
                RouteDataModel(repository: FileRepository())..loadRouteData(),
            child: MaterialApp(
              title: 'Zwift Data Viewer',
              theme: myTheme,
              // localizationsDelegates: [
              //   ArchSampleLocalizationsDelegate(),
              //   ProviderLocalizationsDelegate(),
              // ],
              // onGenerateTitle: (context) =>
              //     ProviderLocalizations.of(context).appTitle,
              routes: {
                AppRoutes.home: (context) => HomeScreen(),
                AppRoutes.allStats: (context) => AllStatsScreen(),
                AppRoutes.allStats: (context) => CalendarScreen(),
                AppRoutes.settings: (context) => SettingsScreen(),
              },
            )));
  }
}
