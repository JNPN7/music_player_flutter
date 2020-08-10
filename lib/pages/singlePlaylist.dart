import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_player/classes/file_info.dart';
import 'package:music_player/classes/playlist.dart';
import 'package:music_player/imports/music_card.dart';
import 'package:music_player/utis/database.dart';

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
            listFiles(context, playlistName),
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

Widget listFiles(BuildContext context, String playlistName){
  Future<List<String>> getFileName() async{
    Playlist instance = Playlist(playlist: playlistName);
    List<String> files = await instance.getFileList();
    return files;
  }
  Future<List<Map<String, dynamic>>> getFiles() async{
    List<String> filesName = await getFileName() ?? [];
    List<Map<String, dynamic>> files = [];
    for (String fileName in filesName){
      List<Map<String, dynamic>> file = await DBprovider.instance.query(fileName);
      print(file.runtimeType);
      print(file);
      files.addAll(file);
    }
    return files;
  }
  return Expanded(
    child: FutureBuilder(
      future: getFiles(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          List<Map<String, dynamic>> files = snapshot.data;
          if (files.isNotEmpty){
            return Column(
              children: files.map((file){
                File filee = File(
                  name: file['name'],
                  path: file['path'],
                  album: file['album'],
                  artist: file['artist'],
                  favorite: file['favorite'],
                  duration: file['duration'],
                  size: file['size'],
                  dateAdded: file['added_date']
                );
                return FutureBuilder(
                  builder: (context, snapshot) => MusicCard(fileInfo: filee, purpose: {},)
                );
              }).toList(),
            );
          }else{
            return Center(
              child: OutlineButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/all_songs', arguments: {
                    'purpose': 'addToPlaylist',
                    'playlistName': playlistName,
                  });
                },
                icon: Icon(Icons.add), 
                label: Text('Add Songs'),
                borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: .8,
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            );
          }
        }else{
          return SpinKitWave(
            color: Colors.grey[300],
            size: 50.0,
          );
        }
      },
    ),
  );
}