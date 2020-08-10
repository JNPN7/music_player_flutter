class File{
  String name;
  String path;
  String album;
  String artist;
  int favorite;
  String duration;
  String size;
  String dateAdded;

  File({this.name, this.path, this.album, this.artist, this.favorite,this.duration, this.size, this.dateAdded});

  File.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    path = map['path'];
    artist = map['artist'];
    album = map['album'];
    duration = map['duration'];
    size = map['size'];
    favorite = map['favorite'];
  }
}