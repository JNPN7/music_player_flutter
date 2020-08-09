import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

class Playlist{
  String playlist;
  String playlistList = 'playlist_list';
  Playlist({this.playlist});
  
  Future createPlaylist(List<String> datas ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listPlaylist = prefs.getStringList(this.playlistList) ?? [];
    listPlaylist.add(this.playlist);
    await prefs.setStringList(this.playlistList, listPlaylist);
  }

  Future<List<String>> getFileList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(this.playlist);
  }

  Future removeFiles(List<String> datas) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listPlaylist = prefs.getStringList(this.playlist) ?? [];
    for (String data in datas) listPlaylist.remove(data);
    await prefs.setStringList(this.playlist, listPlaylist);
  }

  Future addFiles(List<String> datas) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listPlaylist = prefs.getStringList(this.playlist) ?? [];
    for (String data in datas) listPlaylist.add(data);
    await prefs.setStringList(this.playlist, listPlaylist);
  }

  Future removePlaylist() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(this.playlist);
    List<String> playListList = prefs.getStringList(this.playlistList);
    playListList.remove(this.playlist);
    await prefs.setStringList(this.playlistList, playListList);
  }
}