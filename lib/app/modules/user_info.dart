import 'dart:convert';

class UserInfo {
  UserInfo({
    required this.results,
    required this.info,
  });

  final List<Result> results;
  final Info info;

  factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(jsonDecode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}

class Info {
  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  final String seed;
  final int results;
  final int page;
  final String version;

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: json["seed"],
    results: json["results"],
    page: json["page"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "seed": seed,
    "results": results,
    "page": page,
    "version": version,
  };
}

class Result {
  Result({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  final Gender gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final Dob dob;
  final Dob registered;
  final String phone;
  final String cell;
  final Id id;
  final Picture picture;
  final String nat;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    gender: json["gender"] ,
    name: Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    email: json["email"],
    login: Login.fromJson(json["login"]),
    dob: Dob.fromJson(json["dob"]),
    registered: Dob.fromJson(json["registered"]),
    phone: json["phone"],
    cell: json["cell"],
    id: Id.fromJson(json["id"]),
    picture: Picture.fromJson(json["picture"]),
    nat: json["nat"],
  );

  Map<String, dynamic> toJson() => {
    "gender": genderValues.reverse[gender],
    "name": name.toJson(),
    "location": location.toJson(),
    "email": email,
    "login": login.toJson(),
    "dob": dob.toJson(),
    "registered": registered.toJson(),
    "phone": phone,
    "cell": cell,
    "id": id.toJson(),
    "picture": picture.toJson(),
    "nat": nat,
  };
}

class Dob {
  Dob({
    required this.date,
    required this.age,
  });

  final DateTime date;
  final int age;

  factory Dob.fromRawJson(String str) => Dob.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    date: DateTime.parse(json["date"]),
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "age": age,
  };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

class Id {
  Id({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    name: json["name"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value == null ? null : value,
  };
}

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: Street.fromJson(json["street"]),
    city: json["city"],
    state: json["state"],
    country: json["country"],
    postcode: json["postcode"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
    timezone: Timezone.fromJson(json["timezone"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street.toJson(),
    "city": city,
    "state": state,
    "country": country,
    "postcode": postcode,
    "coordinates": coordinates.toJson(),
    "timezone": timezone.toJson(),
  };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  factory Coordinates.fromRawJson(String str) => Coordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Street {
  Street({
    required this.number,
    required this.name,
  });

  final int number;
  final String name;

  factory Street.fromRawJson(String str) => Street.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Street.fromJson(Map<String, dynamic> json) => Street(
    number: json["number"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
  };
}

class Timezone {
  Timezone({
    required this.offset,
    required this.description,
  });

  final String offset;
  final String description;

  factory Timezone.fromRawJson(String str) => Timezone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    offset: json["offset"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "description": description,
  };
}

class Login {
  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    uuid: json["uuid"],
    username: json["username"],
    password: json["password"],
    salt: json["salt"],
    md5: json["md5"],
    sha1: json["sha1"],
    sha256: json["sha256"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "username": username,
    "password": password,
    "salt": salt,
    "md5": md5,
    "sha1": sha1,
    "sha256": sha256,
  };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: json["title"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "first": first,
    "last": last,
  };
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String large;
  final String medium;
  final String thumbnail;

  factory Picture.fromRawJson(String str) => Picture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: json["large"],
    medium: json["medium"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "large": large,
    "medium": medium,
    "thumbnail": thumbnail,
  };
}

class EnumValues<T> {
 late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
