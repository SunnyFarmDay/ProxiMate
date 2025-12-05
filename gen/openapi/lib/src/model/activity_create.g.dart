// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ActivityCreate extends ActivityCreate {
  @override
  final String name;
  @override
  final String description;

  factory _$ActivityCreate([void Function(ActivityCreateBuilder)? updates]) =>
      (ActivityCreateBuilder()..update(updates))._build();

  _$ActivityCreate._({required this.name, required this.description})
      : super._();
  @override
  ActivityCreate rebuild(void Function(ActivityCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityCreateBuilder toBuilder() => ActivityCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityCreate &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivityCreate')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class ActivityCreateBuilder
    implements Builder<ActivityCreate, ActivityCreateBuilder> {
  _$ActivityCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ActivityCreateBuilder() {
    ActivityCreate._defaults(this);
  }

  ActivityCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityCreate other) {
    _$v = other as _$ActivityCreate;
  }

  @override
  void update(void Function(ActivityCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivityCreate build() => _build();

  _$ActivityCreate _build() {
    final _$result = _$v ??
        _$ActivityCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ActivityCreate', 'name'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ActivityCreate', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
