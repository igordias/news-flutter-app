import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/entity/serializer/serializers.dart';
import 'package:flutterapptemplate/data/remote/client/api_service.dart';
import 'package:flutterapptemplate/data/remote/client/request/request_handler.dart';
import 'package:flutterapptemplate/data/remote/entity/built_article.dart';
import 'package:built_collection/built_collection.dart';

class ApiClient extends RequestHandler {
  final ApiService _apiService;
  ApiClient(this._apiService);

    Future<BuiltList<BuiltArticle>> getTopHeadlines(String country) async {
      return await request(_apiService.getTopHeadlines(country));
    }

}
