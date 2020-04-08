import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/client/environment.dart';
import 'package:flutterapptemplate/data/remote/entity/built_article.dart';
import 'package:built_collection/built_collection.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: Environment.entryPoint + Environment.apiVersion)
abstract class ApiService extends ChopperService {
    
  static ApiService create(ChopperClient client) => _$ApiService(client);

  @Get(path: '/top-headlines')
  Future<Response<BuiltList<BuiltArticle>>> getTopHeadlines(
    @Query("country") String country
  );

}
