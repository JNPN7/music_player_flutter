import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:storage_path/storage_path.dart';
import 'package:music_player/classes/file_info.dart';


class FilePaths {
  String filesInStr;
  var files;
  FilePaths(){
    getFilesFromDevice();
  }

  Future<void> getFilesFromDevice() async{
    try {
      this.filesInStr = await StoragePath.audioPath; //contains images path and folder name in json format
      this.files = jsonDecode(this.filesInStr);
    } on PlatformException {
      this.files = 'Failed to get path';
    }
  }

  List<File> getAllFiles(){
    List<File> allFiles = List<File>();
    for (var file in this.files) {
      for (var music in file['files']){
         //{album: Ride The Lightning, artist: Metallica, path: /storage/emulated/0/Music/108 The Call of Ktulu.mp3, dateAdded: 1595862799, displayName: 108 The Call of Ktulu.mp3, duration: 527275, size: 16674287}
        //print(onefile);
        allFiles.add(
          File(
            name: music['displayName'],
            path: music['path'],
            album: music['album'],
            artist: music['artist'],
            duration: music['duration'],
            size: music['size'],
            dateAdded: music['dateAdded']
          )
        );
      }
    }
    return allFiles;
  }
}
