// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<BuiltList<BuiltArticle>>> getTopHeadlines(String country) {
    final $url = 'http://newsapi.org/v2/top-headlines';
    final $params = <String, dynamic>{'country': country};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<BuiltArticle>, BuiltArticle>($request);
  }
}
