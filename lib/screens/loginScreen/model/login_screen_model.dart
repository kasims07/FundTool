// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  Data? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? mobile;
  String? profileImage;
  String? guideTour;
  String? hearAboutUs;
  String? uniqueId;
  int? step;
  String? referralCode;
  int? isFundraiser;
  int? myReferralCodeUsed;
  String? lastFundraiserName;
  String? lastFundraiserUrl;
  int? isJoin;
  String? token;

  Data({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.mobile,
    this.profileImage,
    this.guideTour,
    this.hearAboutUs,
    this.uniqueId,
    this.step,
    this.referralCode,
    this.isFundraiser,
    this.myReferralCodeUsed,
    this.lastFundraiserName,
    this.lastFundraiserUrl,
    this.isJoin,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        profileImage: json["profile_image"],
        guideTour: json["guide_tour"],
        hearAboutUs: json["hear_about_us"],
        uniqueId: json["unique_id"],
        step: json["step"],
        referralCode: json["referral_code"],
        isFundraiser: json["is_fundraiser"],
        myReferralCodeUsed: json["my_referral_code_used"],
        lastFundraiserName: json["last_fundraiser_name"],
        lastFundraiserUrl: json["last_fundraiser_url"],
        isJoin: json["is_join"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
        "profile_image": profileImage,
        "guide_tour": guideTour,
        "hear_about_us": hearAboutUs,
        "unique_id": uniqueId,
        "step": step,
        "referral_code": referralCode,
        "is_fundraiser": isFundraiser,
        "my_referral_code_used": myReferralCodeUsed,
        "last_fundraiser_name": lastFundraiserName,
        "last_fundraiser_url": lastFundraiserUrl,
        "is_join": isJoin,
        "token": token,
      };
}
