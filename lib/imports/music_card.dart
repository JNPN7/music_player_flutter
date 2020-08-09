import 'package:flutter/material.dart';
import 'package:music_player/classes/file_info.dart';
import 'package:music_player/utis/database.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MusicCard extends StatefulWidget {
  final File fileInfo;
  MusicCard({this.fileInfo});

  @override
  _MusicCardState createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    widget.fileInfo.name,
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
                      widget.fileInfo.artist,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async{
                String fav;
                if (widget.fileInfo.favorite == 0){
                  await DBprovider.instance.updateFavorite(1, widget.fileInfo.name);
                  widget.fileInfo.favorite = 1;
                  fav = 'added to Favorite';
                }else{
                  await DBprovider.instance.updateFavorite(0, widget.fileInfo.name);
                  widget.fileInfo.favorite = 0;
                  fav = 'removed from Favorite';
                }
                setState((){});
                Fluttertoast.showToast(
                    msg: fav,
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
            ),
          ],
        ),
      ),
    );
  }
}