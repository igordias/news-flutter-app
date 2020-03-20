import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'serializers.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(_getSerializedRequest(request));
  }

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    final BodyType customBody = _convertToCustomObject<SingleItemType>(dynamicResponse.body);
    return dynamicResponse.copyWith<BodyType>(body: customBody);
  }

  dynamic _convertToCustomObject<SingleItemType>(dynamic element) {
    if (element is SingleItemType) {
      return element;
    } else if (element is List) {
      return _deserializeListOf<SingleItemType>(element);
    } else {
      return _deserialize<SingleItemType>(element);
    }
  }

  BuiltList<SingleItemType> _deserializeListOf<SingleItemType>(List dynamicList) {
    return BuiltList<SingleItemType>(
      dynamicList.map((element) => _deserialize<SingleItemType>(element)),
    );
  }

  SingleItemType _deserialize<SingleItemType>(Map<String, dynamic> value) {
    return serializers.deserializeWith(
      serializers.serializerForType(SingleItemType),
      value,
    );
  }

  Request _getSerializedRequest(Request request) {
    return request.copyWith(
        body: serializers.serializeWith(
      serializers.serializerForType(request.body.runtimeType),
      request.body,
    ));
  }
}
