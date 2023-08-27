class UserModel {
  String? userId;
  String? location;
  String? meterNumber;
  String? userName;
  String? userPhoneNumber;
  String? userImage;

  UserModel({
    this.userId,
    this.location,
    this.meterNumber,
    this.userName,
    this.userPhoneNumber,
    this.userImage,
  });

  UserModel.fromJson(Map<String, dynamic>json){
    userId = json["Fault Type"];
    location = json["location"];
    meterNumber = json["Meter Number"];
    userName = json["Name"];
    userPhoneNumber = json["Phone Number"];
    userImage = json["Image Url"];
  }

  Map<String, dynamic>?toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User Id"] = userId;
    data["location"] = location;
    data["Meter Number"] = meterNumber;
    data["Name"] = userName;
    data["Phone Number"] = userPhoneNumber;
    data["Fault Image"] = userImage;
    return data;
  }
}