import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:manuvs_calendar/internet_services/snack_bar.dart';

class ConnectivityService {
  // Private constructor for singleton
  ConnectivityService._internal();

  // Singleton instance
  static final ConnectivityService _instance = ConnectivityService._internal();

  // Factory constructor to return the same instance
  factory ConnectivityService() => _instance;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  void setConnection(bool connectionStatus){
    this._isConnected = connectionStatus;
  }

  bool connectionStatus(){
    return _isConnected;
  }

  Future<void>  startMonitoring(BuildContext context) async {
    // Initial connectivity check
    var initialResult = await _connectivity.checkConnectivity();

    print("Initial Internet connection resulst :: ${initialResult.name}");
    _updateConnectionStatus(context, initialResult);

    // Start listening to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
          (ConnectivityResult result) {
        _updateConnectionStatus(context, result);
      },
    );
  }

  void stopMonitoring() {
    _connectivitySubscription?.cancel();
  }

  void _updateConnectionStatus(BuildContext context, ConnectivityResult result) {
    final wasConnected = _isConnected;
    _isConnected = result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;

    if (_isConnected && !wasConnected) {
      showConnectedSnackBar(context);
    } else if (!(_isConnected) && wasConnected) {
      showDisconnectedSnackBar(context);
    }
    else if(!(_isConnected && wasConnected)){
      showDisconnectedSnackBar(context);
    }
  }

  void showConnectedSnackBar(BuildContext context) {
    showSnackBar(context, "Internet connected", "success");
  }

  void showDisconnectedSnackBar(BuildContext context) {
    showSnackBar(context, "No internet connection. Please try again later.", "error");
  }
}
