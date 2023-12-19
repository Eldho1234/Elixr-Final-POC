import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, List<ActivityRecorder>>(
        converter: (Store<AppState> store) => store.state.activityRecorder,
        builder: (BuildContext context, List<ActivityRecorder> activityRecorderList) {
          return ListView.builder(
            itemCount: activityRecorderList.length,
            itemBuilder: (context, index) {
              ActivityRecorder activityRecorder = activityRecorderList[index];
              return ListTile(
                title: Text('Issue: ${activityRecorder.issue ?? ''}'),
subtitle: Text('Date: ${activityRecorder.date ?? ''}'),
                // Add other fields as needed
              );
            },
          );
        },
      ),
    );
  
  }
}