import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/core/util/serializers.dart';
import 'package:flutterapptemplate/data/remote/client/api_service.dart';
import 'package:flutterapptemplate/data/remote/client/auth_interceptor.dart';
import 'package:flutterapptemplate/data/remote/client/built_value_converter.dart';
import 'package:flutterapptemplate/data/remote/client/request_handler.dart';
import 'package:flutterapptemplate/data/remote/entity/built_article.dart';
import 'package:flutterapptemplate/data/remote/entity/built_response.dart';
import 'package:built_collection/built_collection.dart';

class ApiClient extends RequestHandler {
  final ApiService _apiService;
  ApiClient(this._apiService);

    Future<BuiltList<BuiltArticle>> getTopHeadlines(String country) async {
      return await request(_apiService.getTopHeadlines(country));
    }

}
