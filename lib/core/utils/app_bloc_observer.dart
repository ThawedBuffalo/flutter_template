import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/logging/custom_logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) CustomLogger.loggerNoStack.i(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    CustomLogger.loggerNoStack.i(transition);
  }
}
