// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_base.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatRoomBase extends ChatRoomBase {
  @override
  final int peerId;
  @override
  final String peerName;
  @override
  final String restaurant;

  factory _$ChatRoomBase([void Function(ChatRoomBaseBuilder)? updates]) =>
      (ChatRoomBaseBuilder()..update(updates))._build();

  _$ChatRoomBase._(
      {required this.peerId, required this.peerName, required this.restaurant})
      : super._();
  @override
  ChatRoomBase rebuild(void Function(ChatRoomBaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatRoomBaseBuilder toBuilder() => ChatRoomBaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatRoomBase &&
        peerId == other.peerId &&
        peerName == other.peerName &&
        restaurant == other.restaurant;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, peerId.hashCode);
    _$hash = $jc(_$hash, peerName.hashCode);
    _$hash = $jc(_$hash, restaurant.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatRoomBase')
          ..add('peerId', peerId)
          ..add('peerName', peerName)
          ..add('restaurant', restaurant))
        .toString();
  }
}

class ChatRoomBaseBuilder
    implements Builder<ChatRoomBase, ChatRoomBaseBuilder> {
  _$ChatRoomBase? _$v;

  int? _peerId;
  int? get peerId => _$this._peerId;
  set peerId(int? peerId) => _$this._peerId = peerId;

  String? _peerName;
  String? get peerName => _$this._peerName;
  set peerName(String? peerName) => _$this._peerName = peerName;

  String? _restaurant;
  String? get restaurant => _$this._restaurant;
  set restaurant(String? restaurant) => _$this._restaurant = restaurant;

  ChatRoomBaseBuilder() {
    ChatRoomBase._defaults(this);
  }

  ChatRoomBaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _peerId = $v.peerId;
      _peerName = $v.peerName;
      _restaurant = $v.restaurant;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatRoomBase other) {
    _$v = other as _$ChatRoomBase;
  }

  @override
  void update(void Function(ChatRoomBaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatRoomBase build() => _build();

  _$ChatRoomBase _build() {
    final _$result = _$v ??
        _$ChatRoomBase._(
          peerId: BuiltValueNullFieldError.checkNotNull(
              peerId, r'ChatRoomBase', 'peerId'),
          peerName: BuiltValueNullFieldError.checkNotNull(
              peerName, r'ChatRoomBase', 'peerName'),
          restaurant: BuiltValueNullFieldError.checkNotNull(
              restaurant, r'ChatRoomBase', 'restaurant'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
