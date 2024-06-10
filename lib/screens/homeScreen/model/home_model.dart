// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  int? status;
  String? message;
  Data? data;

  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<Fund>? myFund;
  List<Fund>? joinedFund;

  Data({
    this.myFund,
    this.joinedFund,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        myFund: json["my_fund"] == null ? [] : List<Fund>.from(json["my_fund"]!.map((x) => Fund.fromJson(x))),
        joinedFund:
            json["joined_fund"] == null ? [] : List<Fund>.from(json["joined_fund"]!.map((x) => Fund.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "my_fund": myFund == null ? [] : List<dynamic>.from(myFund!.map((x) => x.toJson())),
        "joined_fund": joinedFund == null ? [] : List<dynamic>.from(joinedFund!.map((x) => x.toJson())),
      };
}

class Fund {
  int? id;
  int? userId;
  String? uniqueId;
  String? goalAmount;
  String? earnedAmount;
  String? inPercantage;
  String? raisingReason;
  String? fundraiserName;
  int? totalParticipants;
  String? logo;
  dynamic startDate;
  dynamic endDate;
  dynamic noOfWeeks;
  int? guideTour;
  SectorName? sectorName;
  Type? type;
  dynamic referralCode;
  dynamic hearAboutUs;
  TimeDiff? timeDiff;
  String? isTeam;
  DateTime? createdAt;
  UserInfo? userInfo;

  Fund({
    this.id,
    this.userId,
    this.uniqueId,
    this.goalAmount,
    this.earnedAmount,
    this.inPercantage,
    this.raisingReason,
    this.fundraiserName,
    this.totalParticipants,
    this.logo,
    this.startDate,
    this.endDate,
    this.noOfWeeks,
    this.guideTour,
    this.sectorName,
    this.type,
    this.referralCode,
    this.hearAboutUs,
    this.timeDiff,
    this.isTeam,
    this.createdAt,
    this.userInfo,
  });

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        id: json["id"],
        userId: json["user_id"],
        uniqueId: json["unique_id"],
        goalAmount: json["goal_amount"],
        earnedAmount: json["earned_amount"],
        inPercantage: json["in_percantage"],
        raisingReason: json["raising_reason"],
        fundraiserName: json["fundraiser_name"],
        totalParticipants: json["total_participants"],
        logo: json["logo"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        noOfWeeks: json["no_of_weeks"],
        guideTour: json["guide_tour"],
        sectorName: sectorNameValues.map[json["sector_name"]]!,
        type: typeValues.map[json["type"]]!,
        referralCode: json["referral_code"],
        hearAboutUs: json["hear_about_us"],
        timeDiff: timeDiffValues.map[json["time_diff"]]!,
        isTeam: json["is_team"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "unique_id": uniqueId,
        "goal_amount": goalAmount,
        "earned_amount": earnedAmount,
        "in_percantage": inPercantage,
        "raising_reason": raisingReason,
        "fundraiser_name": fundraiserName,
        "total_participants": totalParticipants,
        "logo": logo,
        "start_date": startDate,
        "end_date": endDate,
        "no_of_weeks": noOfWeeks,
        "guide_tour": guideTour,
        "sector_name": sectorNameValues.reverse[sectorName],
        "type": typeValues.reverse[type],
        "referral_code": referralCode,
        "hear_about_us": hearAboutUs,
        "time_diff": timeDiffValues.reverse[timeDiff],
        "is_team": isTeam,
        "created_at": createdAt?.toIso8601String(),
        "user_info": userInfo?.toJson(),
      };
}

enum SectorName { ME }

final sectorNameValues = EnumValues({"Me": SectorName.ME});

enum TimeDiff { THE_0_DAYS_0_HOURS_0_MINUTES }

final timeDiffValues = EnumValues({"0 days, 0 hours, 0 minutes.": TimeDiff.THE_0_DAYS_0_HOURS_0_MINUTES});

enum Type { INDIVIDUAL }

final typeValues = EnumValues({"individual": Type.INDIVIDUAL});

class UserInfo {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? email;
  String? countryCode;
  String? mobile;

  UserInfo({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.profileImage,
    this.email,
    this.countryCode,
    this.mobile,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profileImage: json["profile_image"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "profile_image": profileImage,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
