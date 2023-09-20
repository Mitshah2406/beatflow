import 'package:beatflow/models/Songs.dart';
import 'package:beatflow/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = FutureProvider<List<Songs>>((ref) async {
  return ApiServices.getRecentlyPlayedSongs();
});
