// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_create_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatMessageCreateRequest extends ChatMessageCreateRequest {
  @override
  final int senderId;
  @override
  final String text;
  @override
  final bool? isMine;

  factory _$ChatMessageCreateRequest(
          [void Function(ChatMessageCreateRequestBuilder)? updates]) =>
      (ChatMessageCreateRequestBuilder()..update(updates))._build();

  _$ChatMessageCreateRequest._(
      {required this.senderId, required this.text, this.isMine})
      : super._();
  @override
  ChatMessageCreateRequest rebuild(
          void Function(ChatMessageCreateRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatMessageCreateRequestBuilder toBuilder() =>
      ChatMessageCreateRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatMessageCreateRequest &&
        senderId == other.senderId &&
        text == other.text &&
        isMine == other.isMine;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, senderId.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, isMine.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatMessageCreateRequest')
          ..add('senderId', senderId)
          ..add('text', text)
          ..add('isMine', isMine))
        .toString();
  }
}

class ChatMessageCreateRequestBuilder
    implements
        Builder<ChatMessageCreateRequest, ChatMessageCreateRequestBuilder> {
  _$ChatMessageCreateRequest? _$v;

  int? _senderId;
  int? get senderId => _$this._senderId;
  set senderId(int? senderId) => _$this._senderId = senderId;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  bool? _isMine;
  bool? get isMine => _$this._isMine;
  set isMine(bool? isMine) => _$this._isMine = isMine;

  ChatMessageCreateRequestBuilder() {
    ChatMessageCreateRequest._defaults(this);
  }

  ChatMessageCreateRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _senderId = $v.senderId;
      _text = $v.text;
      _isMine = $v.isMine;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatMessageCreateRequest other) {
    _$v = other as _$ChatMessageCreateRequest;
  }

  @override
  void update(void Function(ChatMessageCreateRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatMessageCreateRequest build() => _build();

  _$ChatMessageCreateRequest _build() {
    final _$result = _$v ??
        _$ChatMessageCreateRequest._(
          senderId: BuiltValueNullFieldError.checkNotNull(
              senderId, r'ChatMessageCreateRequest', 'senderId'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'ChatMessageCreateRequest', 'text'),
          isMine: isMine,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
