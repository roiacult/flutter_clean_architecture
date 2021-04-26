import 'package:clean_arch2/app.dart';
import 'package:clean_arch2/core/data/data_module.dart';
import 'package:clean_arch2/core/domain/domain_module.dart';
import 'package:clean_arch2/core/presentation/presentation_module.dart';
import 'package:clean_arch2/utils/state_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin/koin.dart';
import 'package:logging/logging.dart' as logger;

void main() {
  Bloc.observer = StateObserver();
  startKoin((app) {
    app.modules([dataModule, domainModule, presentationModule]);
    // app.printLogger(level: Level.debug);
  });
  _setupLogging();
  runApp(CleanArchApp());
}

void _setupLogging() {
  logger.Logger.root.level = logger.Level.ALL;
  logger.Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
