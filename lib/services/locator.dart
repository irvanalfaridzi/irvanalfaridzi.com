import 'package:alfaridzi_me/services/api_client.dart';
import 'package:alfaridzi_me/services/call_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator.registerLazySingleton<CallService>(() => CallService());
  debugPrint('Registered Locator');
}
