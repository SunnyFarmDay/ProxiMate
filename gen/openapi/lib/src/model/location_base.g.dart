// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_base.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LocationBase extends LocationBase {
  @override
  final num latitude;
  @override
  final num longitude;

  factory _$LocationBase([void Function(LocationBaseBuilder)? updates]) =>
      (LocationBaseBuilder()..update(updates))._build();

  _$LocationBase._({required this.latitude, required this.longitude})
      : super._();
  @override
  LocationBase rebuild(void Function(LocationBaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBaseBuilder toBuilder() => LocationBaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationBase &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationBase')
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class LocationBaseBuilder
    implements Builder<LocationBase, LocationBaseBuilder> {
  _$LocationBase? _$v;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  LocationBaseBuilder() {
    LocationBase._defaults(this);
  }

  LocationBaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationBase other) {
    _$v = other as _$LocationBase;
  }

  @override
  void update(void Function(LocationBaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationBase build() => _build();

  _$LocationBase _build() {
    final _$result = _$v ??
        _$LocationBase._(
          latitude: BuiltValueNullFieldError.checkNotNull(
              latitude, r'LocationBase', 'latitude'),
          longitude: BuiltValueNullFieldError.checkNotNull(
              longitude, r'LocationBase', 'longitude'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
