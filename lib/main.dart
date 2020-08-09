import 'package:flutter/material.dart';
import 'package:music_player/pages/loading_screen.dart';
import 'package:music_player/pages/home.dart';
import 'package:music_player/pages/playlist.dart';
import 'package:music_player/pages/favourate.dart';
import 'package:music_player/pages/all_songs.dart';
import 'package:music_player/pages/settings.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingScreen(),
    '/home': (context) => Home(),
    '/favourate': (context) => Favourate(),
    '/playlist': (context) => Playlist(),
    '/all_songs':(context) => AllSongs(),
    '/settings':(context) => Settings(),
  },
));


