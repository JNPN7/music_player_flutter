import 'package:flutter/material.dart';
import 'package:music_player/classes/file_info.dart';
import 'package:music_player/classes/playlist.dart';
import 'package:music_player/utis/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MusicCard extends StatelessWidget {
  final File fileInfo;
  final Map<String, String> purpose;
  MusicCard({this.fileInfo, this.purpose});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            fileText(fileInfo),
            (purpose.isEmpty) ? FavIcon(fileInfo: fileInfo) : PlaylistIcon(fileInfo: fileInfo, purpose: purpose), 
          ],
        ),
      ),
    );
  }
}

Widget fileText(File fileInfo){
  return Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fileInfo.name,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            fileInfo.artist,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    ),
  );
}

class FavIcon extends StatefulWidget {
  final File fileInfo;
  FavIcon({this.fileInfo});
  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async{
        String toast;
        if (widget.fileInfo.favorite == 0){
          await DBprovider.instance.updateFavorite(1, widget.fileInfo.name);
          widget.fileInfo.favorite = 1;
          toast = 'added to Favorite';
        }else{
          await DBprovider.instance.updateFavorite(0, widget.fileInfo.name);
          widget.fileInfo.favorite = 0;
          toast = 'removed from Favorite';
        }
        setState((){});
        Fluttertoast.showToast(
            msg: toast,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[600],
            textColor: Colors.white,
            fontSize: 14.0
        );
      },
      icon: Icon(
        Icons.favorite,
        color: (widget.fileInfo.favorite == 0) ? Colors.grey : Colors.black87,
      ),
    );
  }
}

class PlaylistIcon extends StatefulWidget {
  final File fileInfo;
  final Map<String, String> purpose;
  PlaylistIcon({this.fileInfo, this.purpose});
  @override
  _PlaylistIconState createState() => _PlaylistIconState();
}

class _PlaylistIconState extends State<PlaylistIcon> {
  bool inPlaylist;
  Future<bool> isInPlaylist(File fileInfo, String playlist) async{
    Playlist instance = Playlist(playlist: playlist);
    List<String> fileList = await instance.getFileList() ?? [];
    if(fileList.isNotEmpty){
      for (String file in fileList){
        if (file == fileInfo.name) return true;
      }
    }
    return false;   
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async{
        String toast;
        bool inPlaylist = await isInPlaylist(widget.fileInfo, widget.purpose['playlistName']);
        if (!inPlaylist){
          Playlist instance = Playlist(playlist: widget.purpose['playlistName']);
          instance.addFiles([widget.fileInfo.name]);
          toast = 'Added to ${widget.purpose['playlistName']}';
        }else{
          Playlist instance = Playlist(playlist: widget.purpose['playlistName']);
          instance.removeFiles([widget.fileInfo.name]);
          toast = 'Removed from ${widget.purpose['playlistName']}';
        }
        setState((){});
        Fluttertoast.showToast(
            msg: toast,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[600],
            textColor: Colors.white,
            fontSize: 14.0
        );
      },
      icon: FutureBuilder(
        future: isInPlaylist(widget.fileInfo, widget.purpose['playlistName']),
        builder: (context,snapshot) {
          if (snapshot.data == true){
            return Icon(
              Icons.add_box,
              color: Colors.black26,
            );
          }else{
            return Icon(
              Icons.add_box,
              color: Colors.white,
            );
          } 
        },
      ),
    );
  }
}