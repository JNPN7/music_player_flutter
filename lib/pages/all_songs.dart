import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_player/classes/file_info.dart';
// import 'package:music_player/classes/gets_files_path.dart';
import 'package:music_player/imports/music_card.dart';
import 'package:music_player/utis/database.dart';


class AllSongs extends StatefulWidget {
  @override
  _AllSongsState createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {

  Future<List<Map<String, dynamic>>> getAllFiles(BuildContext context) async{
    List<Map<String, dynamic>> allFiles = await DBprovider.instance.queryAll();
    return allFiles;
  }


  // Map<String, dynamic> allFiles;
  // List<File> all;

  // bool check = false;
  
  // Future<void> getAllFiles() async{
  //   FilePaths instance = FilePaths();
  //   await instance.getFilesFromDevice();
  //   allFiles = instance.getAllFiles();
    
  // }


  // @override
  // void initState(){
  //   super.initState();
  //   getAllFiles().then((response){
  //     setState(() {
  //       check = true;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // allFiles = ModalRoute.of(context).settings.arguments;
    // all = allFiles['allFiles'];
    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'All Songs',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: getAllFiles(context),
        builder: (context, snapshot){
          if (snapshot.hasData){
            List<Map<String, dynamic>> allFiles = snapshot.data;
            return Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: ListView(
                children: allFiles.map((file) {
                  // print(file);
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
              )
            );
          }else{
            return SpinKitWave(
              color: Colors.grey[300],
              size: 50.0,
            );
          }
        },
      )
    );
  }
}