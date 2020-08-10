import 'package:flutter/material.dart';
import 'package:music_player/pages/loading_screen.dart';
import 'package:music_player/pages/home.dart';
import 'package:music_player/pages/listofPlaylist.dart';
import 'package:music_player/pages/favourate.dart';
import 'package:music_player/pages/all_songs.dart';
import 'package:music_player/pages/settings.dart';
import 'package:music_player/pages/singlePlaylist.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingScreen(),
    '/home': (context) => Home(),
    '/favourate': (context) => Favourate(),
    '/playlist': (context) => ListOfPlaylist(),
    '/all_songs': (context) => AllSongs(),
    '/settings': (context) => Settings(),
    '/single_playlist': (context) =>  SinglePlaylist(),
  },
));


