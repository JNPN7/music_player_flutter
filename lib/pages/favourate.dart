import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_player/classes/file_info.dart';
import 'package:music_player/imports/music_card.dart';
import 'package:music_player/utis/database.dart';

class Favourate extends StatefulWidget {
  @override
  _FavourateState createState() => _FavourateState();
}

class _FavourateState extends State<Favourate> {
  
  Future<List<Map<String, dynamic>>> getAllFiles(BuildContext context) async{
    List<Map<String, dynamic>> favFiles = await DBprovider.instance.favQuery();
    return favFiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Favourate',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: getAllFiles(context),
        builder: (context, snapshot){
          if (snapshot.hasData){
            List<Map<String, dynamic>> favFiles = snapshot.data;
            return Padding(
              padding:  EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: favFiles.isNotEmpty ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: favFiles.map((file){
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
                    return MusicCard(fileInfo: filee);
                  }).toList(),
                ),
              )
              : Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Seems like you have no Favorite!!',
                  style: TextStyle(color: Colors.grey[600], fontSize: 20),
                )
              )
            );
          }else{
            return SpinKitWave(
              color: Colors.grey[300],
              size: 50.0,
            );
          }
        }
      )
    );
  }
}

