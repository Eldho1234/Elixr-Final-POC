import 'package:flutter/material.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/model/model.dart';

class AppState {
  final UserDetails? user;
   final List<ActivityRecorder> activityRecorder;
  final String? signUpError;
  final bool? signUpSuccess;
  final bool? isFetching;

  AppState({
    required this.activityRecorder,
    this.user,
    this.signUpError,
    this.signUpSuccess,
    this.isFetching,
  });
  AppState copyWith({
    List<ActivityRecorder>? activityRecorder,
    UserDetails? user,
    String? signUpError,
    bool? signUpSuccess,
    bool? isFetching,
  }) {
    return AppState(
      activityRecorder: activityRecorder ?? this.activityRecorder,
      user: user ?? this.user,
      signUpError: signUpError ?? this.signUpError,
      signUpSuccess: signUpSuccess ?? this.signUpSuccess,
      isFetching: isFetching ?? this.isFetching,
    );
  }

  factory AppState.initial() {
    return AppState(
      activityRecorder: [],
        signUpError: '',
        signUpSuccess: false,
        isFetching: false,
        user: UserDetails(
          firstName: '',
          lastName: '',
          emailId: '',
          password: '',
        ));
  }
}

class SignUpAction {
  final UserDetails user;
  SignUpAction(this.user);
}

class signUpSuccess {}

class FaliedAction {
  final String errorMsg;
  FaliedAction({
    required this.errorMsg,
  });
}

class loginAction {
  final String email;
  final String password;
// final Function(String) showSnackBar;
  loginAction({required this.email, required this.password});
}

class loginSuccess {
  final UserDetails userDetails;

  loginSuccess({required this.userDetails});
}

class loginFaieled{}


class LoadActivitiesAction{
  final List<ActivityRecorder> activities;

  LoadActivitiesAction({required this.activities});
}

class createActivityAction {
  final ActivityRecorder createActivityRecorder;
  createActivityAction({required this.createActivityRecorder});
}

class updateActivityAction {
  final int index;
  final ActivityRecorder updateActivityRecorder;
 updateActivityAction({required this.index,required this.updateActivityRecorder});
}

class deleteActivityAction {
  final int index;
  deleteActivityAction({required this.index});
}


// class setUserDataAction {
//   final List<ActivityRecorder> activityRecorderList;
//   final String userEmail;
 
//   setUserDataAction(this.activityRecorderList, this.userEmail);
// }

// class showExsistingDataAction{}