import 'dart:convert';

import 'package:brick_app/model/brick_set.dart';
import 'package:brick_app/model/brick_set_list.dart';
import 'package:brick_app/service/rebrickable_api_constants.dart';
import 'package:http/http.dart';
import 'dart:async';

class RebrickableService {
  Client _client;
  String _apiKey;
  String _token;

  set apiKey(String apiKey) => _apiKey = apiKey;

  bool get isAuthenticated => _token != null;

  RebrickableService(this._apiKey, {Client client}) {
    this._client = client ?? Client();
  }

  Future<bool> authenticate(String username, String password) async {
    final response = await _client.post(userTokenUrl,
        headers: createHeader(contentType: 'application/x-www-form-urlencoded'),
        body: 'username=$username&password=$password');

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      return false;
    }

    final body = jsonDecode(response.body);
    _token = body['user_token'];
    return _token != null;
  }

  Future<List<BrickSetList>> getUsersSetList({int listId}) async {
    final userSetListUrl = Uri.parse(userSetListUrlTemplate
        .expand({'user_token': _token, 'list_id': listId}));
    final response = await _client.get(userSetListUrl, headers: createHeader());

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      return null;
    }

    final body = jsonDecode(response.body);

    var results = body['results'] as List;
    return results
        .map((json) => BrickSetList.fromJson(json))
        .toList(growable: false);
  }

  Future<List<BrickSet>> getSetsFromList({int listId}) async {
    final userSetListUrl = Uri.parse(userSetListDetailsUrlTemplate
        .expand({'user_token': _token, 'list_id': listId}));
    final response = await _client.get(userSetListUrl, headers: createHeader());

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      return null;
    }

    final body = jsonDecode(response.body);

    var results = body['results'] as List;
    return results
        .map((json) => BrickSet.fromJson(json['set']))
        .toList(growable: false);
  }

  Map<String, String> createHeader({String contentType}) {
    if (contentType != null) {
      return {'Authorization': 'key $_apiKey', 'content-type': contentType};
    } else {
      return {'Authorization': 'key $_apiKey'};
    }
  }
}
