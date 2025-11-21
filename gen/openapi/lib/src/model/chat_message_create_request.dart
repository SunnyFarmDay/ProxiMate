//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_message_create_request.g.dart';

/// ChatMessageCreateRequest
///
/// Properties:
/// * [senderId] 
/// * [text] 
/// * [isMine] 
@BuiltValue()
abstract class ChatMessageCreateRequest implements Built<ChatMessageCreateRequest, ChatMessageCreateRequestBuilder> {
  @BuiltValueField(wireName: r'sender_id')
  int get senderId;

  @BuiltValueField(wireName: r'text')
  String get text;

  @BuiltValueField(wireName: r'is_mine')
  bool? get isMine;

  ChatMessageCreateRequest._();

  factory ChatMessageCreateRequest([void updates(ChatMessageCreateRequestBuilder b)]) = _$ChatMessageCreateRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatMessageCreateRequestBuilder b) => b
      ..isMine = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatMessageCreateRequest> get serializer => _$ChatMessageCreateRequestSerializer();
}

class _$ChatMessageCreateRequestSerializer implements PrimitiveSerializer<ChatMessageCreateRequest> {
  @override
  final Iterable<Type> types = const [ChatMessageCreateRequest, _$ChatMessageCreateRequest];

  @override
  final String wireName = r'ChatMessageCreateRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatMessageCreateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'sender_id';
    yield serializers.serialize(
      object.senderId,
      specifiedType: const FullType(int),
    );
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
    if (object.isMine != null) {
      yield r'is_mine';
      yield serializers.serialize(
        object.isMine,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatMessageCreateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatMessageCreateRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sender_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.senderId = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        case r'is_mine':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMine = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatMessageCreateRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatMessageCreateRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

