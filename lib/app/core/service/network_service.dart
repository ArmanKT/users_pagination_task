import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity;
  final StreamController<bool> _connectionController = StreamController<bool>.broadcast();

  bool _isOnline = false;

  Stream<bool> get onStatusChange => _connectionController.stream;
  bool get isOnline => _isOnline;

  NetworkService({required Connectivity connectivity}) : _connectivity = connectivity {
    _init();
  }

  Future<void> _init() async {
    // Handles latest API returning List<ConnectivityResult>
    final results = await _connectivity.checkConnectivity();
    _updateStatus(_hasConnection(results));

    _connectivity.onConnectivityChanged.listen((results) {
      _updateStatus(_hasConnection(results));
    });
  }

  bool _hasConnection(List<ConnectivityResult> results) {
    // True if any network type (wifi, mobile, ethernet) is connected
    return results.any((r) => r != ConnectivityResult.none);
  }

  void _updateStatus(bool online) {
    if (_isOnline != online) {
      _isOnline = online;
      _connectionController.add(online);
    }
  }

  void dispose() {
    _connectionController.close();
  }
}
