import 'package:flutter/material.dart';
import 'package:music_player/imports/add_playlist_strap.dart';
import 'package:music_player/imports/showlist_playlist.dart';

class ListOfPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Playlist',
          style: TextStyle(color: Colors.white, fontSize: 20),          
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Column(
          children: <Widget>[
            addPlaylist(context),
            SizedBox(height: 15,),
            ShowPlaylist(),
          ],
        ),
      ),
    );
  }
}