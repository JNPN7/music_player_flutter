import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_player/classes/file_info.dart';
import 'package:music_player/classes/gets_files_path.dart';
import 'package:music_player/utis/database.dart';
// import 'package:music_player/classes/playlist.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin{
  List<File> allFiles;
  List<Map<String, dynamic>> files;
  String allfiles;
  
  void _openFileExplorer() async{
    FilePaths instance = FilePaths();
    await instance.getFilesFromDevice();
    allFiles = instance.getAllFiles();
    files = await DBprovider.instance.queryAll();
    if (files.isEmpty){
      for(var file in allFiles){
        int i = await DBprovider.instance.insert({
          DBprovider.columnName: file.name,
          DBprovider.columnPath: file.path,
          DBprovider.columnArtist: file.artist,
          DBprovider.columnAlbum: file.album,
          DBprovider.columnDuration: file.duration,
          DBprovider.columnSize: file.size,
          DBprovider.columnAddedDate: file.dateAdded,
        });
        print(i);
      }
    }else{
      //add new files
      for (var file in allFiles){
        bool add = true;
        for (var dbfile in files){
          if (file.name == dbfile['name']){
            add = false;
            break;
          }
          if (file.name == dbfile['name'] && file.path != dbfile['path']){
            int i = await DBprovider.instance.updatePath(dbfile['path'], dbfile['id']);
            print(i);
          }
        }
        if (add){
          int i = await DBprovider.instance.insert({
            DBprovider.columnName: file.name,
            DBprovider.columnPath: file.path,
            DBprovider.columnArtist: file.artist,
            DBprovider.columnAlbum: file.album,
            DBprovider.columnDuration: file.duration,
            DBprovider.columnSize: file.size,
            DBprovider.columnAddedDate: file.dateAdded,
          });
          print(i);
        }
      }

      //delete deleted file
      for (var dbfile in files){
        bool delete = true;
        for (var file in allFiles){
          if (file.name == dbfile['name']){
            delete = false;
            break;
          }
        }
        if (delete){
          int i = await DBprovider.instance.delete(dbfile['name']);
          print(i);
        }
      }
    }
    // test();
    Navigator.pushReplacementNamed(context, '/home',
      // arguments: {
      //   'allFiles': allFiles,
      // }
    );
  }

  // void test() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList('playlist_list', []);
  //   Playlist haha = Playlist(playlist: 'hahah');
  //   await haha.createPlaylist(['haha', 'uuua', 'soso', 'fff']);
  //   print(await haha.getFileList()); 
  //   await haha.removeFiles(['uuua', 'haha', 'fff']);
  //   print(await haha.getFileList());
  //   await haha.addFiles(['uu', '12', 'f34f']);
  //   print(await haha.getFileList());
  //   print(prefs.getStringList('playlist_list'));
  //   await haha.removePlaylist();
  //   print(prefs.getStringList('playlist_list'));
  // }
  @override
  void initState() {
    super.initState();
    _openFileExplorer();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: SpinKitSquareCircle(
        color: Colors.grey[300],
        size: 100.0,
        controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1000)),
      )
    );
  }
}