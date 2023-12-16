// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PosteoData extends DataClass implements Insertable<PosteoData> {
  final String name;
  final String intelligence;
  final String gender;
  final String image;
  final bool isFavorite;
  PosteoData(
      {required this.name,
      required this.intelligence,
      required this.gender,
      required this.image,
      required this.isFavorite});
  factory PosteoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PosteoData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      intelligence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}intelligence'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      isFavorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isFavorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['intelligence'] = Variable<String>(intelligence);
    map['gender'] = Variable<String>(gender);
    map['image'] = Variable<String>(image);
    map['isFavorite'] = Variable<bool>(isFavorite);
    return map;
  }

  PosteoCompanion toCompanion(bool nullToAbsent) {
    return PosteoCompanion(
      name: Value(name),
      intelligence: Value(intelligence),
      gender: Value(gender),
      image: Value(image),
      isFavorite: Value(isFavorite),
    );
  }

  factory PosteoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PosteoData(
      name: serializer.fromJson<String>(json['name']),
      intelligence: serializer.fromJson<String>(json['intelligence']),
      gender: serializer.fromJson<String>(json['gender']),
      image: serializer.fromJson<String>(json['image']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'intelligence': serializer.toJson<String>(intelligence),
      'gender': serializer.toJson<String>(gender),
      'image': serializer.toJson<String>(image),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  PosteoData copyWith(
          {String? name,
          String? intelligence,
          String? gender,
          String? image,
          bool? isFavorite}) =>
      PosteoData(
        name: name ?? this.name,
        intelligence: intelligence ?? this.intelligence,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('PosteoData(')
          ..write('name: $name, ')
          ..write('intelligence: $intelligence, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(name, intelligence, gender, image, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PosteoData &&
          other.name == this.name &&
          other.intelligence == this.intelligence &&
          other.gender == this.gender &&
          other.image == this.image &&
          other.isFavorite == this.isFavorite);
}

class PosteoCompanion extends UpdateCompanion<PosteoData> {
  final Value<String> name;
  final Value<String> intelligence;
  final Value<String> gender;
  final Value<String> image;
  final Value<bool> isFavorite;
  const PosteoCompanion({
    this.name = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.gender = const Value.absent(),
    this.image = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  PosteoCompanion.insert({
    required String name,
    required String intelligence,
    required String gender,
    required String image,
    required bool isFavorite,
  })  : name = Value(name),
        intelligence = Value(intelligence),
        gender = Value(gender),
        image = Value(image),
        isFavorite = Value(isFavorite);
  static Insertable<PosteoData> custom({
    Expression<String>? name,
    Expression<String>? intelligence,
    Expression<String>? gender,
    Expression<String>? image,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (intelligence != null) 'intelligence': intelligence,
      if (gender != null) 'gender': gender,
      if (image != null) 'image': image,
      if (isFavorite != null) 'isFavorite': isFavorite,
    });
  }

  PosteoCompanion copyWith(
      {Value<String>? name,
      Value<String>? intelligence,
      Value<String>? gender,
      Value<String>? image,
      Value<bool>? isFavorite}) {
    return PosteoCompanion(
      name: name ?? this.name,
      intelligence: intelligence ?? this.intelligence,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<String>(intelligence.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isFavorite.present) {
      map['isFavorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PosteoCompanion(')
          ..write('name: $name, ')
          ..write('intelligence: $intelligence, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $PosteoTable extends Posteo with TableInfo<$PosteoTable, PosteoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PosteoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<String?> intelligence = GeneratedColumn<String?>(
      'intelligence', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool?> isFavorite = GeneratedColumn<bool?>(
      'isFavorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (isFavorite IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [name, intelligence, gender, image, isFavorite];
  @override
  String get aliasedName => _alias ?? 'posteo';
  @override
  String get actualTableName => 'posteo';
  @override
  VerificationContext validateIntegrity(Insertable<PosteoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('isFavorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['isFavorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PosteoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PosteoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PosteoTable createAlias(String alias) {
    return $PosteoTable(attachedDatabase, alias);
  }
}

abstract class _$AppDataBases extends GeneratedDatabase {
  _$AppDataBases(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PosteoTable posteo = $PosteoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posteo];
}
