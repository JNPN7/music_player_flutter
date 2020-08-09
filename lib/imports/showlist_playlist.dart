import 'package:flutter/material.dart';
import 'package:music_player/imports/playlist_card.dart';

class ShowPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          spacing: 30,
          runSpacing: 10,
          children: <Widget>[
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
            PlaylistCard(title: 'hahah'),
          ],
        ),
      ),
    );
  }
}