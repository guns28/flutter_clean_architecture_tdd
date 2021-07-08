import 'package:json_annotation/json_annotation.dart';

part 'list_merchants_response.g.dart';

@JsonSerializable()
class ListMerchantsResponse {
  final List<Merchant>? merchants;

  ListMerchantsResponse({this.merchants});

  factory ListMerchantsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMerchantsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListMerchantsResponseToJson(this);
}

@JsonSerializable()
class Merchant {
  int id;
  String name;
  String phoneNumber;
  String currency;
  String locale;
  String timezone;
  Location location;
  String reviewScore;
  List<TagGroups> tagGroups;
  List<Image>? images;
  List<Document>? documents;
  List<Link>? links;
  bool bookable;
  OpeningTimes openingTimes;
  bool ccvEnabled;

  Merchant({required this.id,
    required this.name,
    required this.phoneNumber,
    required this.currency,
    required this.locale,
    required this.timezone,
    required this.location,
    required this.reviewScore,
    required this.tagGroups,
    this.images,
    this.documents,
    this.links,
    required this.bookable,
    required this.openingTimes,
    required this.ccvEnabled,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}

@JsonSerializable()
class Location {
  Coordinates coordinates;
  Address address;

  Location({required this.coordinates, required this.address});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Coordinates {
  double latitude;
  double longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Address {
  String street;
  String number;
  String zipcode;
  String city;
  String country;
  String district;

  Address(
      {required this.street,
        required this.number,
        required this.zipcode,
        required this.city,
        required this.country,
        required this.district});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class TagGroups {
  String type;
  List<Tag> tags;

  TagGroups({required this.type, required this.tags});

  factory TagGroups.fromJson(Map<String, dynamic> json) =>
      _$TagGroupsFromJson(json);
  Map<String, dynamic> toJson() => _$TagGroupsToJson(this);
}

@JsonSerializable()
class Tag {
  String id;
  String name;

  Tag({required this.id, required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) =>
      _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}


@JsonSerializable()
class Image {
  String url;

  Image({required this.url});

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class Document {
  String name;
  String url;
  String format;
  String description;

  Document({required this.name,
    required this.url,
    required this.format,
    required this.description});

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class Link {
  String href;
  String method;
  String rel;

  Link({required this.href,
    required this.method,
    required this.rel});

  factory Link.fromJson(Map<String, dynamic> json) =>
      _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class OpeningTimes {
  StandardOpeningTimes standardOpeningTimes;

  OpeningTimes({required this.standardOpeningTimes});

  factory OpeningTimes.fromJson(Map<String, dynamic> json) =>
      _$OpeningTimesFromJson(json);
  Map<String, dynamic> toJson() => _$OpeningTimesToJson(this);
}

@JsonSerializable()
class StandardOpeningTimes {
  List<Day>? MONDAY;
  List<Day>? THURSDAY;
  List<Day>? WEDNESDAY;
  List<Day>? TUESDAY;
  List<Day>? FRIDAY;
  List<Day>? SATURDAY;
  List<Day>? SUNDAY;

  StandardOpeningTimes(
      {this.MONDAY,
        this.THURSDAY,
        this.WEDNESDAY,
        this.TUESDAY,
        this.FRIDAY,
        this.SATURDAY,
      this.SUNDAY});

  factory StandardOpeningTimes.fromJson(Map<String, dynamic> json) =>
      _$StandardOpeningTimesFromJson(json);
  Map<String, dynamic> toJson() => _$StandardOpeningTimesToJson(this);
}

@JsonSerializable()
class Day {
  String start;
  String end;

  Day({required this.start, required this.end});

  factory Day.fromJson(Map<String, dynamic> json) =>
      _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}