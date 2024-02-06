// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyMarkCollection on Isar {
  IsarCollection<DailyMark> get dailyMarks => this.collection();
}

const DailyMarkSchema = CollectionSchema(
  name: r'DailyMark',
  id: 3111071375027839803,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'marks': PropertySchema(
      id: 1,
      name: r'marks',
      type: IsarType.doubleList,
    ),
    r'totalMarks': PropertySchema(
      id: 2,
      name: r'totalMarks',
      type: IsarType.double,
    )
  },
  estimateSize: _dailyMarkEstimateSize,
  serialize: _dailyMarkSerialize,
  deserialize: _dailyMarkDeserialize,
  deserializeProp: _dailyMarkDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyMarkGetId,
  getLinks: _dailyMarkGetLinks,
  attach: _dailyMarkAttach,
  version: '3.1.0+1',
);

int _dailyMarkEstimateSize(
  DailyMark object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.marks.length * 8;
  return bytesCount;
}

void _dailyMarkSerialize(
  DailyMark object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeDoubleList(offsets[1], object.marks);
  writer.writeDouble(offsets[2], object.totalMarks);
}

DailyMark _dailyMarkDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyMark();
  object.date = reader.readString(offsets[0]);
  object.id = id;
  object.marks = reader.readDoubleList(offsets[1]) ?? [];
  object.totalMarks = reader.readDouble(offsets[2]);
  return object;
}

P _dailyMarkDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyMarkGetId(DailyMark object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyMarkGetLinks(DailyMark object) {
  return [];
}

void _dailyMarkAttach(IsarCollection<dynamic> col, Id id, DailyMark object) {
  object.id = id;
}

extension DailyMarkQueryWhereSort
    on QueryBuilder<DailyMark, DailyMark, QWhere> {
  QueryBuilder<DailyMark, DailyMark, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyMarkQueryWhere
    on QueryBuilder<DailyMark, DailyMark, QWhereClause> {
  QueryBuilder<DailyMark, DailyMark, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyMarkQueryFilter
    on QueryBuilder<DailyMark, DailyMark, QFilterCondition> {
  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition>
      marksElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition>
      marksElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'marks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'marks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'marks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'marks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition>
      marksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'marks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> marksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'marks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> totalMarksEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition>
      totalMarksGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> totalMarksLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterFilterCondition> totalMarksBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalMarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DailyMarkQueryObject
    on QueryBuilder<DailyMark, DailyMark, QFilterCondition> {}

extension DailyMarkQueryLinks
    on QueryBuilder<DailyMark, DailyMark, QFilterCondition> {}

extension DailyMarkQuerySortBy on QueryBuilder<DailyMark, DailyMark, QSortBy> {
  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> sortByTotalMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMarks', Sort.asc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> sortByTotalMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMarks', Sort.desc);
    });
  }
}

extension DailyMarkQuerySortThenBy
    on QueryBuilder<DailyMark, DailyMark, QSortThenBy> {
  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> thenByTotalMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMarks', Sort.asc);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QAfterSortBy> thenByTotalMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMarks', Sort.desc);
    });
  }
}

extension DailyMarkQueryWhereDistinct
    on QueryBuilder<DailyMark, DailyMark, QDistinct> {
  QueryBuilder<DailyMark, DailyMark, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyMark, DailyMark, QDistinct> distinctByMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marks');
    });
  }

  QueryBuilder<DailyMark, DailyMark, QDistinct> distinctByTotalMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMarks');
    });
  }
}

extension DailyMarkQueryProperty
    on QueryBuilder<DailyMark, DailyMark, QQueryProperty> {
  QueryBuilder<DailyMark, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyMark, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailyMark, List<double>, QQueryOperations> marksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marks');
    });
  }

  QueryBuilder<DailyMark, double, QQueryOperations> totalMarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMarks');
    });
  }
}
