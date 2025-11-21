//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_room_base.g.dart';

/// ChatRoomBase
///
/// Properties:
/// * [peerId] 
/// * [peerName] 
/// * [restaurant] 
@BuiltValue()
abstract class ChatRoomBase implements Built<ChatRoomBase, ChatRoomBaseBuilder> {
  @BuiltValueField(wireName: r'peer_id')
  int get peerId;

  @BuiltValueField(wireName: r'peer_name')
  String get peerName;

  @BuiltValueField(wireName: r'restaurant')
  String get restaurant;

  ChatRoomBase._();

  factory ChatRoomBase([void updates(ChatRoomBaseBuilder b)]) = _$ChatRoomBase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatRoomBaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatRoomBase> get serializer => _$ChatRoomBaseSerializer();
}

class _$ChatRoomBaseSerializer implements PrimitiveSerializer<ChatRoomBase> {
  @override
  final Iterable<Type> types = const [ChatRoomBase, _$ChatRoomBase];

  @override
  final String wireName = r'ChatRoomBase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatRoomBase object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatRoomBase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatRoomBaseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatRoomBase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatRoomBaseBuilder();
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

