// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String name;
  final double money;
  User({required this.name, required this.money});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      money: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}money'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['money'] = Variable<double>(money);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      name: Value(name),
      money: Value(money),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      name: serializer.fromJson<String>(json['name']),
      money: serializer.fromJson<double>(json['money']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'money': serializer.toJson<double>(money),
    };
  }

  User copyWith({String? name, double? money}) => User(
        name: name ?? this.name,
        money: money ?? this.money,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('name: $name, ')
          ..write('money: $money')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, money.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User && other.name == this.name && other.money == this.money);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> name;
  final Value<double> money;
  const UsersCompanion({
    this.name = const Value.absent(),
    this.money = const Value.absent(),
  });
  UsersCompanion.insert({
    required String name,
    required double money,
  })  : name = Value(name),
        money = Value(money);
  static Insertable<User> custom({
    Expression<String>? name,
    Expression<double>? money,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (money != null) 'money': money,
    });
  }

  UsersCompanion copyWith({Value<String>? name, Value<double>? money}) {
    return UsersCompanion(
      name: name ?? this.name,
      money: money ?? this.money,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (money.present) {
      map['money'] = Variable<double>(money.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('name: $name, ')
          ..write('money: $money')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedRealColumn money = _constructMoney();
  GeneratedRealColumn _constructMoney() {
    return GeneratedRealColumn(
      'money',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, money];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
