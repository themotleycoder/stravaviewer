import 'package:flutter/widgets.dart';
import 'package:zwiftdataviewer/utils/repository/routerepository.dart';
import 'package:zwiftdataviewer/utils/worlddata.dart';

class RouteDataModel extends ChangeNotifier {
  final RouteRepository repository;
  Map<int, List<RouteData>> _routeData;
  int _worldFilter;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Map<int, List<RouteData>> get routeData => _routeData;

  routeType _routeFilter;

  set filterWorldId(int worldId) {
    _worldFilter = worldId;
  }

  set filter(routeType filter) {
    _routeFilter = filter;
    notifyListeners();
  }

  set routeData(Map<int, List<RouteData>> routeData) {
    _routeData = routeData;
    saveRouteData(_routeData);
  }

  Future<Map<int, List<RouteData>>> loadRouteData() async {
    _isLoading = true;
    notifyListeners();

    return repository.loadRouteData().then((loadedRouteData) {
      _routeData = loadedRouteData;
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future saveRouteData(Map<int, List<RouteData>> routeData) async {
    _isLoading = true;
    notifyListeners();

    return repository.saveRouteData(routeData).then((temp) {
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future updateRouteData() async {
    _isLoading = true;
    notifyListeners();

    return repository.saveRouteData(_routeData).then((temp) {
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  RouteDataModel({@required this.repository});

  List<RouteData> get filteredRoutes {
    return _routeData[_worldFilter].where((route) {
      switch (_routeFilter) {
        case routeType.eventonly:
          return route.eventOnly.toLowerCase() == "event only";
        case routeType.basiconly:
          return route.eventOnly.toLowerCase() != "event only";
        default:
          return true;
      }
    }).toList();
  }
}

class RouteData {
  String url;
  String world;
  String distance;
  String altitude;
  String eventOnly;
  String routeName;
  bool completed = false;
  int id;
  int imageId;

  RouteData(this.url, this.world, this.distance, this.altitude, this.eventOnly,
      this.routeName, this.id);

  RouteData.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    world = json['world'];
    distance = json['distance'];
    altitude = json['altitude'];
    eventOnly = json['eventOnly'];
    routeName = json['routeName'];
    completed = json['completed'];
    id = json['id'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['world'] = this.world;
    data['distance'] = this.distance;
    data['altitude'] = this.altitude;
    data['eventOnly'] = this.eventOnly;
    data['routeName'] = this.routeName;
    data['completed'] = this.completed;
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    return data;
  }
}
