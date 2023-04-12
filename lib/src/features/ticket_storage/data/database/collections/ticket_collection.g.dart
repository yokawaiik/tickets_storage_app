// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTicketCollectionCollection on Isar {
  IsarCollection<TicketCollection> get ticketCollections => this.collection();
}

const TicketCollectionSchema = CollectionSchema(
  name: r'TicketCollection',
  id: -8428948067396431253,
  properties: {
    r'filePath': PropertySchema(
      id: 0,
      name: r'filePath',
      type: IsarType.string,
    ),
    r'fileUrl': PropertySchema(
      id: 1,
      name: r'fileUrl',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    )
  },
  estimateSize: _ticketCollectionEstimateSize,
  serialize: _ticketCollectionSerialize,
  deserialize: _ticketCollectionDeserialize,
  deserializeProp: _ticketCollectionDeserializeProp,
  idName: r'key',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'fileUrl': IndexSchema(
      id: -2720505513539609775,
      name: r'fileUrl',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fileUrl',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ticketCollectionGetId,
  getLinks: _ticketCollectionGetLinks,
  attach: _ticketCollectionAttach,
  version: '3.0.5',
);

int _ticketCollectionEstimateSize(
  TicketCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.filePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fileUrl.length * 3;
  bytesCount += 3 + object.id.length * 3;
  return bytesCount;
}

void _ticketCollectionSerialize(
  TicketCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.filePath);
  writer.writeString(offsets[1], object.fileUrl);
  writer.writeString(offsets[2], object.id);
}

TicketCollection _ticketCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TicketCollection(
    filePath: reader.readStringOrNull(offsets[0]),
    fileUrl: reader.readString(offsets[1]),
    id: reader.readString(offsets[2]),
  );
  return object;
}

P _ticketCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ticketCollectionGetId(TicketCollection object) {
  return object.key;
}

List<IsarLinkBase<dynamic>> _ticketCollectionGetLinks(TicketCollection object) {
  return [];
}

void _ticketCollectionAttach(
    IsarCollection<dynamic> col, Id id, TicketCollection object) {}

extension TicketCollectionByIndex on IsarCollection<TicketCollection> {
  Future<TicketCollection?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  TicketCollection? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<TicketCollection?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<TicketCollection?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id', values);
  }

  Future<Id> putById(TicketCollection object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(TicketCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<TicketCollection> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<TicketCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }

  Future<TicketCollection?> getByFileUrl(String fileUrl) {
    return getByIndex(r'fileUrl', [fileUrl]);
  }

  TicketCollection? getByFileUrlSync(String fileUrl) {
    return getByIndexSync(r'fileUrl', [fileUrl]);
  }

  Future<bool> deleteByFileUrl(String fileUrl) {
    return deleteByIndex(r'fileUrl', [fileUrl]);
  }

  bool deleteByFileUrlSync(String fileUrl) {
    return deleteByIndexSync(r'fileUrl', [fileUrl]);
  }

  Future<List<TicketCollection?>> getAllByFileUrl(List<String> fileUrlValues) {
    final values = fileUrlValues.map((e) => [e]).toList();
    return getAllByIndex(r'fileUrl', values);
  }

  List<TicketCollection?> getAllByFileUrlSync(List<String> fileUrlValues) {
    final values = fileUrlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'fileUrl', values);
  }

  Future<int> deleteAllByFileUrl(List<String> fileUrlValues) {
    final values = fileUrlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'fileUrl', values);
  }

  int deleteAllByFileUrlSync(List<String> fileUrlValues) {
    final values = fileUrlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'fileUrl', values);
  }

  Future<Id> putByFileUrl(TicketCollection object) {
    return putByIndex(r'fileUrl', object);
  }

  Id putByFileUrlSync(TicketCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'fileUrl', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFileUrl(List<TicketCollection> objects) {
    return putAllByIndex(r'fileUrl', objects);
  }

  List<Id> putAllByFileUrlSync(List<TicketCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'fileUrl', objects, saveLinks: saveLinks);
  }
}

extension TicketCollectionQueryWhereSort
    on QueryBuilder<TicketCollection, TicketCollection, QWhere> {
  QueryBuilder<TicketCollection, TicketCollection, QAfterWhere> anyKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TicketCollectionQueryWhere
    on QueryBuilder<TicketCollection, TicketCollection, QWhereClause> {
  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      keyEqualTo(Id key) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: key,
        upper: key,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      keyNotEqualTo(Id key) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: key, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: key, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: key, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: key, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      keyGreaterThan(Id key, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: key, includeLower: include),
      );
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      keyLessThan(Id key, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: key, includeUpper: include),
      );
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      keyBetween(
    Id lowerKey,
    Id upperKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerKey,
        includeLower: includeLower,
        upper: upperKey,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause> idEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      idNotEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      fileUrlEqualTo(String fileUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fileUrl',
        value: [fileUrl],
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterWhereClause>
      fileUrlNotEqualTo(String fileUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileUrl',
              lower: [],
              upper: [fileUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileUrl',
              lower: [fileUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileUrl',
              lower: [fileUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileUrl',
              lower: [],
              upper: [fileUrl],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TicketCollectionQueryFilter
    on QueryBuilder<TicketCollection, TicketCollection, QFilterCondition> {
  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filePath',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filePath',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      filePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      fileUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      keyEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      keyGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      keyLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
      ));
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterFilterCondition>
      keyBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TicketCollectionQueryObject
    on QueryBuilder<TicketCollection, TicketCollection, QFilterCondition> {}

extension TicketCollectionQueryLinks
    on QueryBuilder<TicketCollection, TicketCollection, QFilterCondition> {}

extension TicketCollectionQuerySortBy
    on QueryBuilder<TicketCollection, TicketCollection, QSortBy> {
  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      sortByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      sortByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      sortByFileUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileUrl', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      sortByFileUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileUrl', Sort.desc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TicketCollectionQuerySortThenBy
    on QueryBuilder<TicketCollection, TicketCollection, QSortThenBy> {
  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      thenByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      thenByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      thenByFileUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileUrl', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      thenByFileUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileUrl', Sort.desc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QAfterSortBy>
      thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }
}

extension TicketCollectionQueryWhereDistinct
    on QueryBuilder<TicketCollection, TicketCollection, QDistinct> {
  QueryBuilder<TicketCollection, TicketCollection, QDistinct>
      distinctByFilePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QDistinct> distinctByFileUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TicketCollection, TicketCollection, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }
}

extension TicketCollectionQueryProperty
    on QueryBuilder<TicketCollection, TicketCollection, QQueryProperty> {
  QueryBuilder<TicketCollection, int, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<TicketCollection, String?, QQueryOperations> filePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filePath');
    });
  }

  QueryBuilder<TicketCollection, String, QQueryOperations> fileUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileUrl');
    });
  }

  QueryBuilder<TicketCollection, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
