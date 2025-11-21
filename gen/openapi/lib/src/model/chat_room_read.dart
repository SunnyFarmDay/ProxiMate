//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_room_read.g.dart';

/// ChatRoomRead
///
/// Properties:
/// * [peerId] 
/// * [peerName] 
/// * [restaurant] 
/// * [id] 
/// * [createdAt] 
@BuiltValue()
abstract class ChatRoomRead implements Built<ChatRoomRead, ChatRoomReadBuilder> {
  @BuiltValueField(wireName: r'peer_id')
  int get peerId;

  @BuiltValueField(wireName: r'peer_name')
  String get peerName;

  @BuiltValueField(wireName: r'restaurant')
  String get restaurant;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  ChatRoomRead._();

  factory ChatRoomRead([void updates(ChatRoomReadBuilder b)]) = _$ChatRoomRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatRoomReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatRoomRead> get serializer => _$ChatRoomReadSerializer();
}

class _$ChatRoomReadSerializer implements PrimitiveSerializer<ChatRoomRead> {
  @override
  final Iterable<Type> types = const [ChatRoomRead, _$ChatRoomRead];

  @override
  final String wireName = r'ChatRoomRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatRoomRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'peer_id';
    yield serializers.serialize(
      object.peerId,
      specifiedType: const FullType(int),
    );
    yield r'peer_name';
    yield serializers.serialize(
      object.peerName,
      specifiedType: const FullType(String),
    );
    yield r'restaurant';
    yield serializers.serialize(
      object.restaurant,
      specifiedType: const FullType(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatRoomRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatRoomReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'peer_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.peerId = valueDes;
          break;
        case r'peer_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.peerName = valueDes;
          break;
        case r'restaurant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.restaurant = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatRoomRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatRoomReadBuilder();
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

