import 'dart:async';

import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutterapptemplate/presentation/graph/module/api_provider_module.dart';
import 'package:flutterapptemplate/presentation/graph/module/repository_provider_module.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_manager.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_service.dart';
import 'package:flutterapptemplate/presentation/util/error/error_handler.dart';
import 'package:flutterapptemplate/presentation/util/error/error_stream_controller.dart';
import 'package:kiwi/kiwi.dart';

abstract class Injector {
  static Container container;

  static final resolve = container.resolve;

  static setup() async {
    container = Container();
    _provideErrorHandler();
    _provideDialog();
    _setupModules();
    await _provideLocalization();
  }

  static void _setupModules() {
    ApiProviderModule.setup();
    RepositoryProviderModule.setup();
  }

  static void _provideErrorHandler() {
    container.registerSingleton((c) => ErrorStreamController());
    container.registerSingleton((c) => ErrorHandler());
  }

  static void _provideDialog() {
    container.registerSingleton((c) => DialogService());
    container.registerSingleton((c) => DialogManager());
  }

  static _provideLocalization() async {
    LocalizationDelegate localizationDelegate = await LocalizationDelegate.create(
        fallbackLocale: 'en', supportedLocales: ['en', 'pt']);
    container.registerSingleton((c) => localizationDelegate);
  }
}
