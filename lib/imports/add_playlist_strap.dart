import 'package:flutter/material.dart';

createPlaylistAlertDialog(BuildContext context){
  TextEditingController plalistName = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Playlist Name'),
          content: TextField(
            controller: plalistName,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Cancel')
            ),
            FlatButton(
              onPressed: (){
                
              },
              child: Text('OK')
            ),
          ],
        );
      },
    );
}

Widget addPlaylist(BuildContext context){
  
  return Container(
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton.icon(
          onPressed: (){},
          // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.grey[600],
          icon: Icon(Icons.shuffle),
          label: Text('Shuffle Playback'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        IconButton(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          onPressed: (){
            createPlaylistAlertDialog(context);
          },
          icon: Icon(Icons.library_add),
          color: Colors.grey,
        )
      ],
    ),
  );
}