import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_player/imports/playlist_card.dart';
import 'package:music_player/classes/playlist.dart';

class ShowPlaylist extends StatefulWidget {
  @override
  _ShowPlaylistState createState() => _ShowPlaylistState();
}

class _ShowPlaylistState extends State<ShowPlaylist> {
  @override
  Widget build(BuildContext context) {
    Future<List<String>> playlistList() async{
      Playlist instance = Playlist();
      List<String> playlist = await instance.getAllPlaylist();
      return playlist;
    }
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: playlistList(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              List<String> playlistList = snapshot.data;
              return Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 30,
                runSpacing: 10,
                children: playlistList.map((playlist) => PlaylistCard(title: playlist)).toList(),
              );
            }else{
              return SpinKitWave(
                color: Colors.grey[300],
                size: 50.0,
              );
            }
          }
        ),
      ),
    );
  }
}