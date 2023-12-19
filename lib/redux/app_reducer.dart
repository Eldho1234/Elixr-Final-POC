
 
import 'package:flutter/material.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/model/model.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';
import 'package:sampleloginusingapi/widgets/custom_snackbar.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SignUpAction) {
    return state.copyWith(user: action.user, isFetching: true);
  } else if (action is signUpSuccess) {

    print('from reducer SignUpSuccessAction ');
    return state.copyWith(signUpSuccess: true, isFetching: false);
  } else if (action is FaliedAction) {
    print('from reducer error ${action.errorMsg}');
    //CustomSnackBar.showSnackBar(content: action.errorMsg);

    return state.copyWith(
       signUpError: action.errorMsg, isFetching: false, signUpSuccess: false);
  } else if (action is loginAction) {
    return state.copyWith(isFetching: true);
  } else if (action is loginSuccess) {
    print('from reducer Success');
    UserDetails signInUser = UserDetails(
        firstName: action.userDetails.firstName,
        lastName: action.userDetails.lastName,
        emailId: action.userDetails.emailId,
        password: action.userDetails.password);
    return state.copyWith(
      user: signInUser,
      signUpSuccess: true,
      isFetching: false,
    );
  } else if (action is FaliedAction) {
    print('raducer error!!11');
    // SnackBarService.showSnackBar(content: 'Invalid email or password');
    return state.copyWith(signUpSuccess: false, isFetching: false);
  } if (action is LoadActivitiesAction) {
    return state.copyWith(activityRecorder: action.activities);
  } else if (action is createActivityAction) {
    List<ActivityRecorder> updatedList = [...state.activityRecorder, action.createActivityRecorder];
    return state.copyWith(activityRecorder: updatedList);
  } else if (action is updateActivityAction) {
    List<ActivityRecorder> updatedList = List.from(state.activityRecorder);
    updatedList[action.index] = action.updateActivityRecorder;
    return state.copyWith(activityRecorder: updatedList);
  } else if (action is deleteActivityAction) {
    List<ActivityRecorder> updatedList = List.from(state.activityRecorder);
    updatedList.removeAt(action.index);
    return state.copyWith(activityRecorder: updatedList);
  } 
  // if(action is setUserDataAction){
  // return AppState(activityRecorder:action.activityRecorderList,);
  // }else if(action is showExsistingDataAction){
  //   return AppState(activityRecorder:[] );
  // }
  else {
    return state;
  }
 
}