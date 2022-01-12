import 'dart:convert';

List<UserModel> userListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userListModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? json["id"],
        name: json["name"] ?? json["name"],
        username: json["username"] ?? json["username"],
        email: json["email"] ?? json["email"],
        address: json["address"] = Address.fromJson(json["address"]),
        phone: json["phone"] ?? json["phone"],
        website: json["website"] ?? json["website"],
        company: json["company"] = Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? id,
        "name": name ?? name,
        "username": username ?? username,
        "email": email ?? email,
        "address": address ?? address!.toJson(),
        "phone": phone ?? phone,
        "website": website ?? website,
        "company": company ?? company!.toJson(),
      };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"] ?? json["street"],
        suite: json["suite"] ?? json["suite"],
        city: json["city"] ?? json["city"],
        zipcode: json["zipcode"] ?? json["zipcode"],
        geo: json["geo"] = Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street ?? street,
        "suite": suite ?? suite,
        "city": city ?? city,
        "zipcode": zipcode ?? zipcode,
        "geo": geo ?? geo!.toJson(),
      };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"] ?? json["lat"],
        lng: json["lng"] ?? json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat ?? lat,
        "lng": lng ?? lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] ?? json["name"],
        catchPhrase: json["catchPhrase"] ?? json["catchPhrase"],
        bs: json["bs"] ?? json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
