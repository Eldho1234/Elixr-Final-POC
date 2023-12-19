import 'package:redux/redux.dart';
import 'package:sampleloginusingapi/middleware/middleware.dart';
import 'package:sampleloginusingapi/model/model.dart';
import 'package:sampleloginusingapi/redux/app_reducer.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [
  signUpMiddleware(),
  loginMiddleware(),
  sharedPreferencesMiddleware(),
  ],
);