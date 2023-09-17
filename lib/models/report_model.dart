class ReportModel {
  String? faultType;
  String? location;
  String? description;
  String? date;
  String? userName;
  String? userPhoneNumber;
  String? faultImage;
  String? lat;
  String? long;

  ReportModel({
    this.faultType,
    this.location,
    this.description,
    this.date,
    this.userName,
    this.userPhoneNumber,
    this.faultImage,
    this.lat,
    this.long,
  });

  ReportModel.fromJson(Map<String, dynamic>json){
    faultType = json["Fault Type"];
    location = json["location"];
    description = json["Description"];
    date = json["Date"];
    userName = json["Name"];
    userPhoneNumber = json["Phone Number"];
    faultImage = json["Image Url"];
    lat = json["Lat"];
    long = json["Lng"];
  }

  Map<String, dynamic>?toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Fault Type"] = faultType;
    data["location"] = location;
    data["Description"] = description;
    data["Date"] = date;
    data["Name"] = userName;
    data["Phone Number"] = userPhoneNumber;
    data["Fault Image"] = faultImage;
    data["Lat"] = lat;
    data["Lng"] = long;
    return data;
  }
}