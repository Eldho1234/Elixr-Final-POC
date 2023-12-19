import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';
import 'package:sampleloginusingapi/redux/app_store.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ActivityRecorder>>(
        converter: (Store<AppState> store) => store.state.activityRecorder,
        builder: (BuildContext context, List<ActivityRecorder> activityRecorderList) {
            int calculateTotalHours() {
    return store.state.activityRecorder
        .fold<int>(0, (totalHours, activityRecorder) => totalHours + (activityRecorder.hours ?? 0));
  }
          return  Padding(
            padding: const EdgeInsets.only(bottom:10,top: 20,left: 20,right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome User : ",style: TextStyle(fontSize: 25),),
                             Text(store.state.user!.firstName.toString(),style: TextStyle(fontSize: 25)),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: 400,
               
                  color: Color.fromARGB(255, 147, 64, 255),
                  child:Column(
                    children: [
                   Padding(
                     padding: const EdgeInsets.all(30),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Total Task : ",style: TextStyle(fontSize: 25),),
                         Text(activityRecorderList.length.toString(),style: TextStyle(fontSize: 25)),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Total Hours :",style: TextStyle(fontSize: 25),),
                         Text("${calculateTotalHours()}",style: TextStyle(fontSize: 25)),
                       ],
                     ),
                   ),
                   //Text("$tota")
                  ]),
                ),
              ],
            ),
          );
            },
          );
  }
  
}