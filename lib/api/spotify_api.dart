import 'package:http/http.dart' as http;
import 'dart:convert';

//will get the header data
//category name
//category image url
Future<dynamic> spotifyHeader() async {
  var url = Uri.parse(
      'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro/');

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'x-functions-key':
        '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
  });

  if (response.statusCode == 200) {
    // Request successful
    return jsonDecode(response.body);
  } else {
    // Request faileds
    return [];
  }
}

//will get all the playlists in the category of afro
//playlist name
//playlist image url
Future<dynamic> spotifyGetPlayLists(int offset, int limit) async {
  List playylists = [];
  var url = Uri.parse(
      'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro/playlists?offset=$offset&limit=$limit');

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'x-functions-key':
        '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
  });

  if (response.statusCode == 200) {
    // Request successful
    var data = jsonDecode(response.body);
    playylists = data['playlists']['items'] as List;
    return playylists;
  } else {
    // Request failed
    return [];
  }
}

//will get all data for the specific playlist
//image
//description
//followers
//list of tracks
Future<dynamic> spotifyGetSpecificPlayList(String playlistID) async {
  var url = Uri.parse(
      'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/playlists/$playlistID');

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'x-functions-key':
        '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
  });

  if (response.statusCode == 200) {
    // Request successful
    var data = jsonDecode(response.body);

    return data;
  } else {
    // Request failed
    return [];
  }
}

//image
//name
Future<dynamic> spotifyGetSpecificArtist(String artistID) async {
  var url = Uri.parse(
      'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/playlists/$artistID');

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'x-functions-key':
        '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
  });

  if (response.statusCode == 200) {
    // Request successful
    var data = jsonDecode(response.body);

    return data;
  } else {
    // Request failed
    return [];
  }
}
