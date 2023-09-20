import 'dart:convert';

import 'package:beatflow/models/Songs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Songs>> getRecentlyPlayedSongs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString("access_token");
    // print("token $accessToken");
    var res = await http.get(
        Uri.parse(
            "https://api.spotify.com/v1/me/player/recently-played?limit=5"),
        headers: {"Authorization": "Bearer $accessToken"});

    if (res.statusCode < 300) {
      final Map<String, dynamic> data = json.decode(res.body);
      final List<dynamic> results = data['items'];
      // print(results.length);
      return results.map((movieData) => Songs.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
