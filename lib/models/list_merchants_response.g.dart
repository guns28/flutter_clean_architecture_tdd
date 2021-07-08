// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_merchants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMerchantsResponse _$ListMerchantsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMerchantsResponse(
    merchants: (json['merchants'] as List<dynamic>?)
        ?.map((e) => Merchant.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListMerchantsResponseToJson(
        ListMerchantsResponse instance) =>
    <String, dynamic>{
      'merchants': instance.merchants,
    };

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return Merchant(
    id: json['id'] as int,
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    currency: json['currency'] as String,
    locale: json['locale'] as String,
    timezone: json['timezone'] as String,
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    reviewScore: json['reviewScore'] as String,
    tagGroups: (json['tagGroups'] as List<dynamic>)
        .map((e) => TagGroups.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
        .toList(),
    documents: (json['documents'] as List<dynamic>?)
        ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
        .toList(),
    links: (json['links'] as List<dynamic>?)
        ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
        .toList(),
    bookable: json['bookable'] as bool,
    openingTimes:
        OpeningTimes.fromJson(json['openingTimes'] as Map<String, dynamic>),
    ccvEnabled: json['ccvEnabled'] as bool,
  );
}

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'currency': instance.currency,
      'locale': instance.locale,
      'timezone': instance.timezone,
      'location': instance.location,
      'reviewScore': instance.reviewScore,
      'tagGroups': instance.tagGroups,
      'images': instance.images,
      'documents': instance.documents,
      'links': instance.links,
      'bookable': instance.bookable,
      'openingTimes': instance.openingTimes,
      'ccvEnabled': instance.ccvEnabled,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    coordinates:
        Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
      'address': instance.address,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    street: json['street'] as String,
    number: json['number'] as String,
    zipcode: json['zipcode'] as String,
    city: json['city'] as String,
    country: json['country'] as String,
    district: json['district'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
      'city': instance.city,
      'country': instance.country,
      'district': instance.district,
    };

TagGroups _$TagGroupsFromJson(Map<String, dynamic> json) {
  return TagGroups(
    type: json['type'] as String,
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TagGroupsToJson(TagGroups instance) => <String, dynamic>{
      'type': instance.type,
      'tags': instance.tags,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    name: json['name'] as String,
    url: json['url'] as String,
    format: json['format'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'format': instance.format,
      'description': instance.description,
    };

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    href: json['href'] as String,
    method: json['method'] as String,
    rel: json['rel'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'href': instance.href,
      'method': instance.method,
      'rel': instance.rel,
    };

OpeningTimes _$OpeningTimesFromJson(Map<String, dynamic> json) {
  return OpeningTimes(
    standardOpeningTimes: StandardOpeningTimes.fromJson(
        json['standardOpeningTimes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpeningTimesToJson(OpeningTimes instance) =>
    <String, dynamic>{
      'standardOpeningTimes': instance.standardOpeningTimes,
    };

StandardOpeningTimes _$StandardOpeningTimesFromJson(Map<String, dynamic> json) {
  return StandardOpeningTimes(
    MONDAY: (json['MONDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    THURSDAY: (json['THURSDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    WEDNESDAY: (json['WEDNESDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    TUESDAY: (json['TUESDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    FRIDAY: (json['FRIDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    SATURDAY: (json['SATURDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    SUNDAY: (json['SUNDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StandardOpeningTimesToJson(
        StandardOpeningTimes instance) =>
    <String, dynamic>{
      'MONDAY': instance.MONDAY,
      'THURSDAY': instance.THURSDAY,
      'WEDNESDAY': instance.WEDNESDAY,
      'TUESDAY': instance.TUESDAY,
      'FRIDAY': instance.FRIDAY,
      'SATURDAY': instance.SATURDAY,
      'SUNDAY': instance.SUNDAY,
    };

Day _$DayFromJson(Map<String, dynamic> json) {
  return Day(
    start: json['start'] as String,
    end: json['end'] as String,
  );
}

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
