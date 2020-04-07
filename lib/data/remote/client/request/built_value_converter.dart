import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/client/request/wrapped_response_body.dart';
import 'package:flutterapptemplate/data/remote/entity/serializer/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(_getSerializedRequest(request));
  }

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(
      Response response) {
    final dynamicResponse = super.convertResponse(response);
    final body = WrappedResponseBody<SingleItemType>(dynamicResponse.body);
    return dynamicResponse.copyWith<BodyType>(body: body.result);
  }

  Request _getSerializedRequest(Request request) {
    return request.copyWith(
        body: serializers.serializeWith(
      serializers.serializerForType(request.body.runtimeType),
      request.body,
    ));
  }
}
