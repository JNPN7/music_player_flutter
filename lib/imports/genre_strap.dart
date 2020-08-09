import 'package:flutter/material.dart';
import 'package:music_player/imports/titlebutton.dart';
import 'package:music_player/imports/playlist_card.dart';

class GenreStrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[
          titlebutton(context, 'Genre'),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                PlaylistCard(title: 'hahah', imagePath: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.gYWkF6AZsbxmLL4O5o76AAHaE8%26pid%3DApi&f=1',),
                PlaylistCard(title: 'hahah', imagePath: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.gYWkF6AZsbxmLL4O5o76AAHaE8%26pid%3DApi&f=1',),
                PlaylistCard(title: 'hahah', imagePath: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.gYWkF6AZsbxmLL4O5o76AAHaE8%26pid%3DApi&f=1',),
                PlaylistCard(title: 'hahah', imagePath: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.gYWkF6AZsbxmLL4O5o76AAHaE8%26pid%3DApi&f=1',),
                PlaylistCard(title: 'hahah', imagePath: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.gYWkF6AZsbxmLL4O5o76AAHaE8%26pid%3DApi&f=1',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}