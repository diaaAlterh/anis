class SliderModel {
  SliderModel({
      this.results,});

  SliderModel.fromJson(dynamic json) {
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
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.title, 
      this.subtitle,});

  Results.fromJson(dynamic json) {
    objectId = json['objectId'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
  String? objectId;
  Image? image;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? subtitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['objectId'] = objectId;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['title'] = title;
    map['subtitle'] = subtitle;
    return map;
  }

}

class Image {
  Image({
      this.type, 
      this.name, 
      this.url,});

  Image.fromJson(dynamic json) {
    type = json['__type'];
    name = json['name'];
    url = json['url'];
  }
  String? type;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__type'] = type;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}