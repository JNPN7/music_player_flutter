import 'package:flutter/material.dart';
import 'package:music_player/classes/playlist.dart';

class SinglePlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, String> playlist = ModalRoute.of(context).settings.arguments;
    String playlistName = playlist['playlistName'];
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        title: Text(
          'SinglePlaylist',
          style: TextStyle(color: Colors.white, fontSize: 20), 
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: <Widget>[
            playlistInfo(playlistName),
            SizedBox(height: 20,),
            addDelete(context, playlistName),
            SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }
}

Widget playlistInfo(String playlistName){
  return Row(
    children: <Widget>[
      Image(
        image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.dozEvAlhTqQRy_QO0M9H8AHaE8%26pid%3DApi&f=1'),
        height: 125,
        width: 125,
        fit: BoxFit.fill,
      ),
      Padding(
        padding: EdgeInsets.only(left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              playlistName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 3,),
            Text(
              'Total Songs',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget addDelete(BuildContext context, String playlistName){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlatButton.icon(
        onPressed: (){
          Playlist instance = Playlist(playlist: playlistName);
          instance.removePlaylist();
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.delete, color:  Colors.white,), 
        label: Text('Delete', style: TextStyle(color:  Colors.white)),
      ),
      FlatButton.icon(
        onPressed: (){
          Navigator.pushNamed(context, '/all_songs', arguments: {
            'purpose': 'addToPlaylist',
            'playlistName': playlistName,
          });
        }, 
        icon: Icon(Icons.library_add, color:  Colors.white,), 
        label: Text('Add to Playlist',  style: TextStyle(color:  Colors.white)),
      ),
    ],
  );
}
