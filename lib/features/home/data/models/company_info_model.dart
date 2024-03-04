class CompanyInfoModel {
  CompanyInfoModel({
    this.results,
  });

  CompanyInfoModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Results {
  Results({
    this.objectId,
    this.lat,
    this.lng,
    this.landLineNumber,
    this.mobilePhoneNumber,
    this.address,
    this.city,
    this.workingDays,
    this.workingHours,
    this.createdAt,
    this.updatedAt,
  });

  Results.fromJson(dynamic json) {
    objectId = json['objectId'];
    lat = json['lat'];
    lng = json['lng'];
    landLineNumber = json['land_line_number'];
    mobilePhoneNumber = json['mobile_phone_number'];
    address = json['address'];
    city = json['city'];
    workingDays = json['working_days'];
    workingHours = json['working_hours'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? objectId;
  double? lat;
  double? lng;
  String? landLineNumber;
  String? mobilePhoneNumber;
  String? address;
  String? city;
  String? workingDays;
  String? workingHours;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['objectId'] = objectId;
    map['lat'] = lat;
    map['lng'] = lng;
    map['land_line_number'] = landLineNumber;
    map['mobile_phone_number'] = mobilePhoneNumber;
    map['address'] = address;
    map['city'] = city;
    map['working_days'] = workingDays;
    map['working_hours'] = workingHours;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
