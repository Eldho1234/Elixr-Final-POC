import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';
import 'package:sampleloginusingapi/widgets/custom_expanision_text.dart';


class CustomActivityTile extends StatelessWidget {
  final String issue;
  final String date;
  final String hours;
  final String comments;
  final String activity;
  final String userame;
  final Widget aicon;
  final Widget bicon;
  

  CustomActivityTile({super.key, required this.issue, required this.date, required this.hours, required this.comments, required this.activity, required this.aicon, required this.bicon, required this.userame});

  @override
  Widget build(BuildContext context) {
    // final String firstName=StoreProvider.of<AppState>(context).state.user!.firstName.toString();
    // final String lastName=StoreProvider.of<AppState>(context).state.user!.lastName.toString();
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), //<-- SEE HERE
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.all(8),
                  title:  Text(userame),
                  subtitle: CustomExText(
                    title: "Issue : ",
                    value: issue,
                  ),
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomExText(
                            title: "Date : ",
                            value: date,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            valueStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          CustomExText(
                            title: "Hours : ",
                            value: hours,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            valueStyle: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                    CustomExText(
                      title: "Comment: ",
                      value: comments,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      valueStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    CustomExText(
                      title: "Activity : ",
                      value: activity,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      valueStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        aicon,
                        bicon
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}

