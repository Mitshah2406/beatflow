// import 'package:flutter/material.dart';
// import 'package:spotify_sdk/spotify_sdk.dart';

// class Temp extends StatelessWidget {
//   const Temp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: SpotifyApp(),
//     );
//   }
// }

// class SpotifyApp extends StatefulWidget {
//   const SpotifyApp({super.key});

//   @override
//   _SpotifyAppState createState() => _SpotifyAppState();
// }

// class _SpotifyAppState extends State<SpotifyApp> {
//   bool _isConnected = false;
//   final String _trackUri = 'spotify:track:5ya2gsaIhTkAuWYEMB0nw5';

//   @override
//   void initState() {
//     super.initState();
//     _initializeSpotify();
//   }

//   void _initializeSpotify() async {
//     final isConnected = await SpotifySdk.connectToSpotifyRemote(
//       clientId: "e9100f641fba47c1adca87b008586c31",
//       redirectUrl: "spotifyclone://oauth2/callback",
//     );
//     if (isConnected) {
//       print("Connected SPotify yaaaay");
//     }
//     setState(() {
//       _isConnected = isConnected;
//     });
//   }

// // authenticate(
// //       clientId: "aea1aa62e0004c05a521c0d2f90e49e7",
// //       redirectUrl:  "http://localhost:3000/",
// //       scope:
// //           'app-remote-control playlist-read-private', // List of required scopes
// //     );
//   void _authenticateSpotify() async {
//     await SpotifySdk.getAccessToken(
//         clientId: "e9100f641fba47c1adca87b008586c31",
//         redirectUrl: "spotifyclone://oauth2/callback");
//   }

//   void _playTrack() async {
//     if (_isConnected) {
//       await SpotifySdk.play(spotifyUri: _trackUri);
//       await SpotifySdk.getCapabilities(spotifyUri: spotifyUri)
//     }
//   }

//   void _pausePlayback() async {
//     if (_isConnected) {
//       await SpotifySdk.pause();
//     }
//   }

//   void _resumePlayback() async {
//     if (_isConnected) {
//       await SpotifySdk.resume();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Spotify SDK Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _authenticateSpotify,
//               child: const Text('Authenticate with Spotify'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _playTrack,
//               child: const Text('Play Track'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _pausePlayback,
//               child: const Text('Pause Playback'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _resumePlayback,
//               child: const Text('Resume Playback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
