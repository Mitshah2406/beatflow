import 'dart:async';
import 'package:beatflow/constants/spotify_details.dart';
import 'package:beatflow/screens/tabs_screen.dart';
import 'package:beatflow/widgets/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool authGoing = false;
  Uri redirected_uri = Uri();
  var controller; //for webview
  Future<void> sendAuthentic() async {
    Uri authorizationUrl = Uri.parse(await SpotifyDetails().getAuthUrl());
    final redirectUri =
        Uri.encodeFull('https://beatflow-de29b.firebaseapp.com/auth');

    setState(() {
      authGoing = true;
    });
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url
                .startsWith('https://beatflow-de29b.firebaseapp.com/auth')) {
              // print(Uri.parse(request.url).queryParameters['code']);
              setState(() {
                authGoing = false;
                redirected_uri = Uri.parse(request.url);
              });

              final dio = Dio();
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final codeVerifier = prefs.getString('code_verifier');
              final response = await dio.post(
                SpotifyDetails.tokenUrl,
                queryParameters: {
                  'grant_type': 'authorization_code',
                  'client_id': SpotifyDetails.clientId,
                  'code': Uri.parse(request.url).queryParameters['code'],
                  'redirect_uri': redirectUri,
                  'code_verifier': codeVerifier
                },
                options: Options(
                  headers: {
                    "Content-Type": 'application/x-www-form-urlencoded'
                  },
                ),
              );

              await prefs.setString(
                  'access_token', response.data['access_token']);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const TabsScreen(),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(authorizationUrl);
  }

  Future<void> connect() async {
    try {
      await sendAuthentic();
    } catch (e) {
      print(e);
      print("error");
    }
  }

  void redirect(authorizationUrl) async {
    await launch(Uri.encodeFull(authorizationUrl.toString()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (authGoing) {
      // Display WebView while authentication is ongoing
      content = WebViewWidget(
        controller: controller,
        // ... WebView settings ..
      );
    } else {
      // Display DummyScreen after authentication is completed
      content = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black38, Colors.black],
              stops: [0.01, .4]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo1.png",
              height: 150,
            ),
            const SizedBox(
              height: 150,
            ),
            Text(
              "Authenticate Yourself",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Button(
              text: "Login/Signup",
              clickHandler: connect,
              logo: const FaIcon(FontAwesomeIcons.user),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: content,
    );
  }
}
