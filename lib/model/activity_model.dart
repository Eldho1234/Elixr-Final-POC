import 'dart:convert';

ActivityRecorder activityRecorderFromJson(String str) => ActivityRecorder.fromJson(json.decode(str));

String activityRecorderToJson(ActivityRecorder data) => json.encode(data.toJson());

class ActivityRecorder {
    int? issue;
    String? date;
    int? hours;
    String? comments;
    String? activity;
    String?first_name;
     String?last_name;

    ActivityRecorder({
        this.issue,
        this.date,
        this.hours,
        this.comments,
        this.activity,
        this.first_name,
        this.last_name,
    });

    factory ActivityRecorder.fromJson(Map<String, dynamic> json) => ActivityRecorder(
        issue: json["issue"],
        date: json["date"],
        hours: json["hours"],
        comments: json["comments"],
        activity: json["activity"],
        first_name:  json["first_name"],
         last_name:  json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "issue": issue,
        "date": date,
        "hours": hours,
        "comments": comments,
        "activity": activity,
        "first_name":first_name,
        "last_name":last_name
    };
}
