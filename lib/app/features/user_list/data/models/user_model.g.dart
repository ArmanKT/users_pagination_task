// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 2;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: (fields[1] as num).toInt(),
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      maidenName: fields[4] as String,
      age: (fields[5] as num).toInt(),
      gender: fields[6] as String,
      email: fields[7] as String,
      phone: fields[8] as String,
      username: fields[9] as String,
      password: fields[10] as String,
      birthDate: fields[11] as String,
      image: fields[12] as String,
      bloodGroup: fields[13] as String,
      height: (fields[14] as num).toDouble(),
      weight: (fields[15] as num).toDouble(),
      eyeColor: fields[16] as String,
      hair: fields[17] as Hair,
      ip: fields[18] as String,
      address: fields[19] as Address,
      macAddress: fields[20] as String,
      university: fields[21] as String,
      bank: fields[22] as Bank,
      company: fields[23] as Company,
      ein: fields[24] as String,
      ssn: fields[25] as String,
      userAgent: fields[26] as String,
      crypto: fields[27] as Crypto,
      role: fields[28] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(28)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.maidenName)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.username)
      ..writeByte(10)
      ..write(obj.password)
      ..writeByte(11)
      ..write(obj.birthDate)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.bloodGroup)
      ..writeByte(14)
      ..write(obj.height)
      ..writeByte(15)
      ..write(obj.weight)
      ..writeByte(16)
      ..write(obj.eyeColor)
      ..writeByte(17)
      ..write(obj.hair)
      ..writeByte(18)
      ..write(obj.ip)
      ..writeByte(19)
      ..write(obj.address)
      ..writeByte(20)
      ..write(obj.macAddress)
      ..writeByte(21)
      ..write(obj.university)
      ..writeByte(22)
      ..write(obj.bank)
      ..writeByte(23)
      ..write(obj.company)
      ..writeByte(24)
      ..write(obj.ein)
      ..writeByte(25)
      ..write(obj.ssn)
      ..writeByte(26)
      ..write(obj.userAgent)
      ..writeByte(27)
      ..write(obj.crypto)
      ..writeByte(28)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final typeId = 3;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      address: fields[1] as String,
      city: fields[2] as String,
      state: fields[3] as String,
      stateCode: fields[4] as String,
      postalCode: fields[5] as String,
      coordinates: fields[6] as Coordinates,
      country: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.stateCode)
      ..writeByte(5)
      ..write(obj.postalCode)
      ..writeByte(6)
      ..write(obj.coordinates)
      ..writeByte(7)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoordinatesAdapter extends TypeAdapter<Coordinates> {
  @override
  final typeId = 4;

  @override
  Coordinates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coordinates(
      lat: (fields[1] as num).toDouble(),
      lng: (fields[2] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Coordinates obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordinatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankAdapter extends TypeAdapter<Bank> {
  @override
  final typeId = 5;

  @override
  Bank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bank(
      cardExpire: fields[1] as String,
      cardNumber: fields[2] as String,
      cardType: fields[3] as String,
      currency: fields[4] as String,
      iban: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bank obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.cardExpire)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.cardType)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.iban);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final typeId = 6;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      department: fields[1] as String,
      name: fields[2] as String,
      title: fields[3] as String,
      address: fields[4] as Address,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.department)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CryptoAdapter extends TypeAdapter<Crypto> {
  @override
  final typeId = 7;

  @override
  Crypto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Crypto(
      coin: fields[1] as String,
      wallet: fields[2] as String,
      network: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Crypto obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.coin)
      ..writeByte(2)
      ..write(obj.wallet)
      ..writeByte(3)
      ..write(obj.network);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HairAdapter extends TypeAdapter<Hair> {
  @override
  final typeId = 8;

  @override
  Hair read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hair(
      color: fields[1] as String,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Hair obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HairAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
