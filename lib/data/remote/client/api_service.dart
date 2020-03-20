import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/client/api_client.dart';
import 'package:flutterapptemplate/data/remote/entity/built_user.dart';
import 'package:built_collection/built_collection.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Post(path: '')
  Future<Response<BuiltList<BuiltUser>>> signIn(
      @Field() String email, @Field() String password);

  static ApiService create() {
    final client = ApiClient([_$ApiService()]);
    return _$ApiService(client);
  }
}
