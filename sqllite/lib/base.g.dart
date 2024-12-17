// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// ignore_for_file: type=lint
class $ProduitsTable extends Produits with TableInfo<$ProduitsTable, Produit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProduitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _libelleMeta =
      const VerificationMeta('libelle');
  @override
  late final GeneratedColumn<String> libelle = GeneratedColumn<String>(
      'libelle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 120),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, libelle, description, photo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produits';
  @override
  VerificationContext validateIntegrity(Insertable<Produit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('libelle')) {
      context.handle(_libelleMeta,
          libelle.isAcceptableOrUnknown(data['libelle']!, _libelleMeta));
    } else if (isInserting) {
      context.missing(_libelleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Produit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      libelle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}libelle'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo'])!,
    );
  }

  @override
  $ProduitsTable createAlias(String alias) {
    return $ProduitsTable(attachedDatabase, alias);
  }
}

class Produit extends DataClass implements Insertable<Produit> {
  final int id;
  final String libelle;
  final String description;
  final String photo;
  const Produit(
      {required this.id,
      required this.libelle,
      required this.description,
      required this.photo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['libelle'] = Variable<String>(libelle);
    map['description'] = Variable<String>(description);
    map['photo'] = Variable<String>(photo);
    return map;
  }

  ProduitsCompanion toCompanion(bool nullToAbsent) {
    return ProduitsCompanion(
      id: Value(id),
      libelle: Value(libelle),
      description: Value(description),
      photo: Value(photo),
    );
  }

  factory Produit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Produit(
      id: serializer.fromJson<int>(json['id']),
      libelle: serializer.fromJson<String>(json['libelle']),
      description: serializer.fromJson<String>(json['description']),
      photo: serializer.fromJson<String>(json['photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'libelle': serializer.toJson<String>(libelle),
      'description': serializer.toJson<String>(description),
      'photo': serializer.toJson<String>(photo),
    };
  }

  Produit copyWith(
          {int? id, String? libelle, String? description, String? photo}) =>
      Produit(
        id: id ?? this.id,
        libelle: libelle ?? this.libelle,
        description: description ?? this.description,
        photo: photo ?? this.photo,
      );
  Produit copyWithCompanion(ProduitsCompanion data) {
    return Produit(
      id: data.id.present ? data.id.value : this.id,
      libelle: data.libelle.present ? data.libelle.value : this.libelle,
      description:
          data.description.present ? data.description.value : this.description,
      photo: data.photo.present ? data.photo.value : this.photo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Produit(')
          ..write('id: $id, ')
          ..write('libelle: $libelle, ')
          ..write('description: $description, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, libelle, description, photo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Produit &&
          other.id == this.id &&
          other.libelle == this.libelle &&
          other.description == this.description &&
          other.photo == this.photo);
}

class ProduitsCompanion extends UpdateCompanion<Produit> {
  final Value<int> id;
  final Value<String> libelle;
  final Value<String> description;
  final Value<String> photo;
  const ProduitsCompanion({
    this.id = const Value.absent(),
    this.libelle = const Value.absent(),
    this.description = const Value.absent(),
    this.photo = const Value.absent(),
  });
  ProduitsCompanion.insert({
    this.id = const Value.absent(),
    required String libelle,
    required String description,
    required String photo,
  })  : libelle = Value(libelle),
        description = Value(description),
        photo = Value(photo);
  static Insertable<Produit> custom({
    Expression<int>? id,
    Expression<String>? libelle,
    Expression<String>? description,
    Expression<String>? photo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (libelle != null) 'libelle': libelle,
      if (description != null) 'description': description,
      if (photo != null) 'photo': photo,
    });
  }

  ProduitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? libelle,
      Value<String>? description,
      Value<String>? photo}) {
    return ProduitsCompanion(
      id: id ?? this.id,
      libelle: libelle ?? this.libelle,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (libelle.present) {
      map['libelle'] = Variable<String>(libelle.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProduitsCompanion(')
          ..write('id: $id, ')
          ..write('libelle: $libelle, ')
          ..write('description: $description, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }
}

abstract class _$ProduitsDatabase extends GeneratedDatabase {
  _$ProduitsDatabase(QueryExecutor e) : super(e);
  $ProduitsDatabaseManager get managers => $ProduitsDatabaseManager(this);
  late final $ProduitsTable produits = $ProduitsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [produits];
}

typedef $$ProduitsTableCreateCompanionBuilder = ProduitsCompanion Function({
  Value<int> id,
  required String libelle,
  required String description,
  required String photo,
});
typedef $$ProduitsTableUpdateCompanionBuilder = ProduitsCompanion Function({
  Value<int> id,
  Value<String> libelle,
  Value<String> description,
  Value<String> photo,
});

class $$ProduitsTableFilterComposer
    extends Composer<_$ProduitsDatabase, $ProduitsTable> {
  $$ProduitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get libelle => $composableBuilder(
      column: $table.libelle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnFilters(column));
}

class $$ProduitsTableOrderingComposer
    extends Composer<_$ProduitsDatabase, $ProduitsTable> {
  $$ProduitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get libelle => $composableBuilder(
      column: $table.libelle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnOrderings(column));
}

class $$ProduitsTableAnnotationComposer
    extends Composer<_$ProduitsDatabase, $ProduitsTable> {
  $$ProduitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get libelle =>
      $composableBuilder(column: $table.libelle, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);
}

class $$ProduitsTableTableManager extends RootTableManager<
    _$ProduitsDatabase,
    $ProduitsTable,
    Produit,
    $$ProduitsTableFilterComposer,
    $$ProduitsTableOrderingComposer,
    $$ProduitsTableAnnotationComposer,
    $$ProduitsTableCreateCompanionBuilder,
    $$ProduitsTableUpdateCompanionBuilder,
    (Produit, BaseReferences<_$ProduitsDatabase, $ProduitsTable, Produit>),
    Produit,
    PrefetchHooks Function()> {
  $$ProduitsTableTableManager(_$ProduitsDatabase db, $ProduitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProduitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProduitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProduitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> libelle = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> photo = const Value.absent(),
          }) =>
              ProduitsCompanion(
            id: id,
            libelle: libelle,
            description: description,
            photo: photo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String libelle,
            required String description,
            required String photo,
          }) =>
              ProduitsCompanion.insert(
            id: id,
            libelle: libelle,
            description: description,
            photo: photo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProduitsTableProcessedTableManager = ProcessedTableManager<
    _$ProduitsDatabase,
    $ProduitsTable,
    Produit,
    $$ProduitsTableFilterComposer,
    $$ProduitsTableOrderingComposer,
    $$ProduitsTableAnnotationComposer,
    $$ProduitsTableCreateCompanionBuilder,
    $$ProduitsTableUpdateCompanionBuilder,
    (Produit, BaseReferences<_$ProduitsDatabase, $ProduitsTable, Produit>),
    Produit,
    PrefetchHooks Function()>;

class $ProduitsDatabaseManager {
  final _$ProduitsDatabase _db;
  $ProduitsDatabaseManager(this._db);
  $$ProduitsTableTableManager get produits =>
      $$ProduitsTableTableManager(_db, _db.produits);
}
