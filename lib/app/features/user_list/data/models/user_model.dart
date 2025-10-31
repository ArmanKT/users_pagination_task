import 'package:hive_ce_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel {
  @HiveField(1)
  int id;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String lastName;
  @HiveField(4)
  String maidenName;
  @HiveField(5)
  int age;
  @HiveField(6)
  String gender;
  @HiveField(7)
  String email;
  @HiveField(8)
  String phone;
  @HiveField(9)
  String username;
  @HiveField(10)
  String password;
  @HiveField(11)
  String birthDate;
  @HiveField(12)
  String image;
  @HiveField(13)
  String bloodGroup;
  @HiveField(14)
  double height;
  @HiveField(15)
  double weight;
  @HiveField(16)
  String eyeColor;
  @HiveField(17)
  Hair hair;
  @HiveField(18)
  String ip;
  @HiveField(19)
  Address address;
  @HiveField(20)
  String macAddress;
  @HiveField(21)
  String university;
  @HiveField(22)
  Bank bank;
  @HiveField(23)
  Company company;
  @HiveField(24)
  String ein;
  @HiveField(25)
  String ssn;
  @HiveField(26)
  String userAgent;
  @HiveField(27)
  Crypto crypto;
  @HiveField(28)
  String role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  String get fullName => '${firstName.trim()} ${lastName.trim()}'.trim();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: json["birthDate"],
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        eyeColor: json["eyeColor"],
        hair: Hair.fromJson(json["hair"]),
        ip: json["ip"],
        address: Address.fromJson(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: Bank.fromJson(json["bank"]),
        company: Company.fromJson(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
        crypto: Crypto.fromJson(json["crypto"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": birthDate,
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair.toJson(),
        "ip": ip,
        "address": address.toJson(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank.toJson(),
        "company": company.toJson(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
        "crypto": crypto.toJson(),
        "role": role,
      };
}

@HiveType(typeId: 3)
class Address {
  @HiveField(1)
  String address;
  @HiveField(2)
  String city;
  @HiveField(3)
  String state;
  @HiveField(4)
  String stateCode;
  @HiveField(5)
  String postalCode;
  @HiveField(6)
  Coordinates coordinates;
  @HiveField(7)
  String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        stateCode: json["stateCode"],
        postalCode: json["postalCode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
        "stateCode": stateCode,
        "postalCode": postalCode,
        "coordinates": coordinates.toJson(),
        "country": country,
      };
}

@HiveType(typeId: 4)
class Coordinates {
  @HiveField(1)
  double lat;
  @HiveField(2)
  double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

@HiveType(typeId: 5)
class Bank {
  @HiveField(1)
  String cardExpire;
  @HiveField(2)
  String cardNumber;
  @HiveField(3)
  String cardType;
  @HiveField(4)
  String currency;
  @HiveField(5)
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
      );

  Map<String, dynamic> toJson() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
      };
}

@HiveType(typeId: 6)
class Company {
  @HiveField(1)
  String department;
  @HiveField(2)
  String name;
  @HiveField(3)
  String title;
  @HiveField(4)
  Address address;

  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "department": department,
        "name": name,
        "title": title,
        "address": address.toJson(),
      };
}

@HiveType(typeId: 7)
class Crypto {
  @HiveField(1)
  String coin;
  @HiveField(2)
  String wallet;
  @HiveField(3)
  String network;

  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coin: json["coin"],
        wallet: json["wallet"],
        network: json["network"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "wallet": wallet,
        "network": network,
      };
}

@HiveType(typeId: 8)
class Hair {
  @HiveField(1)
  String color;
  @HiveField(2)
  String type;

  Hair({
    required this.color,
    required this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "type": type,
      };
}
