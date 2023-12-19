import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sampleloginusingapi/middleware/api_servies.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/model/model.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';
import 'package:sampleloginusingapi/view/screens/spenttime.dart';
import 'package:shared_preferences/shared_preferences.dart';

Middleware<AppState> signUpMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is SignUpAction) {
      print("i am here");
      UserDetails userDetails = action.user;
      print(userDetails.emailId);
      try {
        final int response = await ApiService.signUp(userDetails);
        debugPrint(response.toString());
        print(jsonEncode(userDetails.toMap()));
        print(response);
        if (response == 200) {
          print("Success");
          store.dispatch(signUpSuccess());
          return SnackBar(content: Text("Sign up successfull"));
        } else if (response == 400) {
          store.dispatch(FaliedAction(errorMsg: "UnAuthorized access"));
          return SnackBar(content: Text("UnAuthorized access"));
        } else if (response == 401) {
          store.dispatch(FaliedAction(errorMsg: "Resource access forbidden"));
          return SnackBar(content: Text("Resource access forbidden"));
        } else if (response == 403) {
          store.dispatch(FaliedAction(errorMsg: "Resource access forbidden"));
          return SnackBar(content: Text("Resource access forbidden"));
        } else if (response == 404) {
          store.dispatch(FaliedAction(errorMsg: "Resource not Found"));
          return SnackBar(content: Text("Resource not Found"));
        } else if (response == 500) {
          store.dispatch(FaliedAction(errorMsg: "Internal server error"));
          return SnackBar(content: Text("Internal server error"));
        } else {
          store.dispatch(FaliedAction(errorMsg: "Unknown error"));
          return SnackBar(content: Text("Unknown error"));
        }
      } catch (error) {
        store.dispatch(FaliedAction(errorMsg: error.toString()));
      }
    }

    next(action);
  };
}

Middleware<AppState> loginMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is loginAction) {
      print('from middleware !!!!!!!');
      try {
        UserDetails response = await ApiService.login(
            email: action.email, password: action.password);

        if (response.emailId!.isNotEmpty) {
          store.dispatch(loginSuccess(userDetails: response));
          print(response.firstName);
        } else {
          store.dispatch(loginFaieled());
        }
      } catch (e) {
        print('Error in middleware: $e');

        store.dispatch(loginFaieled());
      }
    }
    next(action);
  };
}

Middleware<AppState> sharedPreferencesMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (action is LoadActivitiesAction) {
      await _loadActivitiesFromSharedPreference(store, preferences);
    } else if (action is createActivityAction ||
        action is updateActivityAction ||
        action is deleteActivityAction) {
      await _saveActivitiesFromSharedPreference(store, preferences);
    }
    return next(action);
  };
}

Future<List<ActivityRecorder>> _loadActivitiesFromSharedPreference(
    Store<AppState> store, SharedPreferences preferences) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String>? activityjson = preferences.getStringList("activities");
  if (activityjson != null) {
    return activityjson
        .map((e) => ActivityRecorder.fromJson(json.decode(e)))
        .toList();
  } else {
    return [];
  }
}

Future<void> _saveActivitiesFromSharedPreference(
    Store<AppState> store, SharedPreferences preferences) async {
  List<String> activityJson = store.state.activityRecorder
      .map((e) => json.encode(ActivityRecorder.fromJson(e.toJson())))
      .toList();
  preferences.setStringList('activities', activityJson);
}
