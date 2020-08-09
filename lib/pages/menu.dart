import 'package:flutter/material.dart';
// import 'package:music_player/classes/file_info.dart';

// Map<String, List<File>> data; 
// List<File> dat;

Widget menu(context, _slideAnimation, _menuscaleAnimation){// data){
  // data = ModalRoute.of(context).settings.arguments;
  // print(data['allFiles'].runtimeType);
  return SlideTransition(
    position: _slideAnimation,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: ScaleTransition(
        scale: _menuscaleAnimation,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0,150,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: CircleAvatar(
                      // backgroundImage: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.YdkNhFNLUQ_NN3gZir70pQHaHZ%26pid%3DApi&f=1'),
                      radius: 30,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  Divider(
                    height: 70,
                    color: Colors.white,
                  )
                ]
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/all_songs', 
                      // arguments: {
                      //   'allFiles': data['allFiles'],
                      // }
                    );
                  },
                    child: Text(
                      'Listen Now',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/favourate');
                  },
                  child: Text(
                    'Favourate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/playlist');
                  },
                  child: Text(
                    'Playlist',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    ),
  );
}