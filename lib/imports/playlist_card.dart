import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String imagePath;
  final String title;
  PlaylistCard({this.imagePath = '', this.title = ''});
  @override
  Widget build(BuildContext context) {
    // Size screen = MediaQuery.of(context).size;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/single_playlist', arguments: {
              'playlistName': this.title,
            });
          },
          child: Column(
            children: <Widget>[
              Image(
                image: imagePath != '' ? NetworkImage(imagePath) : NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.dozEvAlhTqQRy_QO0M9H8AHaE8%26pid%3DApi&f=1'),
                height: 125,
                width: 125,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 5,),
              Text(
                title != '' ? title : 'New Playlist',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}