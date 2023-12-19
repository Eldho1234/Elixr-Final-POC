import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';

class UpdateTaskBottomModalSheet extends StatelessWidget {
   final TextEditingController _IssueController = TextEditingController();
    final TextEditingController _DateController = TextEditingController();
    final TextEditingController _HoursController = TextEditingController();
    final TextEditingController _CommentController = TextEditingController();
    final TextEditingController _ActivityController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    final int index;

  UpdateTaskBottomModalSheet({required this.index}); 
  @override
  Widget build(BuildContext context) {
    return Form(
                key: formkey,
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Add Activity",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              controller: _IssueController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'field can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  label: const Text("Issue"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              readOnly: true,
                              controller: _DateController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'field can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Date",
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2100));
                                        if (pickedDate != null) {
                                          String formatDate =
                                              DateFormat("dd-MM-yyyy")
                                                  .format(pickedDate);
                                          _DateController.text =
                                              formatDate.toString();
                                        }
                                      },
                                      icon: const Icon(Icons.calendar_month)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _HoursController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'field can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  label: const Text("Hours"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              controller: _CommentController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'field can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  label: const Text("Comment"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              controller: _ActivityController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'field can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  label: const Text("Activity"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    _IssueController.clear();
                                    _DateController.clear();
                                    _HoursController.clear();
                                    _CommentController.clear();
                                    _ActivityController.clear();
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 40,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                    ),
                                  )),
                              const SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    final valid =
                                        formkey.currentState!.validate();
                                    if (valid) {
                                      final updateActivity = ActivityRecorder(
                                         first_name: StoreProvider.of<AppState>(context).state.user!.firstName,
                                       last_name:StoreProvider.of<AppState>(context).state.user!.lastName,
                                        issue:
                                            int.tryParse(_IssueController.text),
                                        date: _DateController.text,
                                        hours:
                                            int.tryParse(_HoursController.text),
                                        comments: _CommentController.text,
                                        activity: _ActivityController.text,
                                      );
                                      StoreProvider.of<AppState>(context)
                                          .dispatch(updateActivityAction(index: index, updateActivityRecorder: updateActivity));
                                                  Navigator.pop(context);
                                      print("created");
                                    } else {
                                      return;
                                    }
                                    _IssueController.clear();
                                    _DateController.clear();
                                    _HoursController.clear();
                                    _CommentController.clear();
                                    _ActivityController.clear();
                                  },
                                  child: const CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 40,
                                      child: Icon(
                                        Icons.done,
                                        size: 30,
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );;
  }
}