import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpotifyDetails {
  // final List<String> scopes = [
  //   'user-read-private',
  //   'user-read-email',
  //   'playlist-read-private',
  //   'user-modify-playback-state',
  //   'user-read-playback-state'
  // ];
  List<String> scopes = [
    'user-read-private',
    'user-read-email',
    'playlist-read-private',
    'playlist-read-collaborative',
    'playlist-modify-public',
    'playlist-modify-private',
    'user-library-read',
    'user-library-modify',
    'user-read-playback-state',
    'user-modify-playback-state',
    'user-read-currently-playing',
    'user-follow-read',
    'user-follow-modify',
    'user-top-read',
    'ugc-image-upload',
    'app-remote-control',
    'streaming',
    'user-read-recently-played',
    'user-read-playback-position',
    'user-top-read',
    'user-read-recently-played'
    // Add more scopes here if needed
  ];
  static const String clientId = 'e9100f641fba47c1adca87b008586c31';
  static const String clientSecret = 'a73f9971f53a42ba815b2d4f5ab55418';
  static const String redirectUri =
      'https://beatflow-de29b.firebaseapp.com/auth';

  static const String tokenUrl = 'https://accounts.spotify.com/api/token';

  String codeVerifier(int length) {
    var text = '';
    var possibleValues =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    for (var i = 0; i < length; i++) {
      text += possibleValues[Random().nextInt(possibleValues.length)];
    }
    return text;
  }

  Future<String> generateCodeChallenge(String codeVerifier) async {
    String base64UrlEncode(Uint8List bytes) {
      return base64Url
          .encode(bytes)
          .replaceAll('+', '-')
          .replaceAll('/', '_')
          .replaceAll('=', '');
    }

    const utf8Encoder = Utf8Encoder();
    final data = utf8Encoder.convert(codeVerifier);
    final hash = sha256.convert(data);
    return base64UrlEncode(Uint8List.fromList(hash.bytes));
  }

  Future<String> getAuthUrl() async {
    var cvCode = codeVerifier(128);
    var codeChallenge = await generateCodeChallenge(cvCode);
    var state = codeVerifier(16);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('code_verifier', cvCode);
    final fullUrl = Uri.https(
      'accounts.spotify.com',
      'authorize',
      {
        'client_id': clientId,
        'response_type': 'code',
        'state': state,
        'scope': scopes,
        'code_challenge_method': 'S256',
        'redirect_uri': redirectUri,
        'code_challenge': codeChallenge
      },
    );

    return fullUrl.toString();
  }
}
