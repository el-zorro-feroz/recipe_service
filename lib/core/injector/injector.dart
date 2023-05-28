import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final services = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => services.init();
