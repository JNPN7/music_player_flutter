import 'package:flutter/material.dart';
import 'package:music_player/imports/home_header.dart';
import 'package:music_player/imports/genre_strap.dart';
import 'package:music_player/imports/titlebutton.dart';

Widget dashboard(BuildContext context, refresh(), inMenu, duration, _scaleAnimation){
  Size screen = MediaQuery.of(context).size;
  return AnimatedPositioned(
    top: 0,
    bottom:0,
    left: inMenu ? 0.6 * screen.width : 0,
    right: inMenu ? -0.6 * screen.width : 0,
    duration: duration,
    child: InkWell(
      onTap: (){
        if (inMenu){
          refresh();
        }
      }, 
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 10,
          color: Colors.grey[600],
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    // border: Border.all(
                    //   color: Colors.grey[900],
                    // ),
                  ),
                  child: SafeArea(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 25, //vjguguygttgu
                          ),
                          onPressed: () {
                            refresh();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                HomeHeader(),
                SizedBox(height: 15,),
                GenreStrap(),
                SizedBox(height: 20,),
                GenreStrap(),
                SizedBox(height: 20,),
                titlebutton(context, 'Recent'),
                
              ],
            ),
          ),
        ),
      ),
    ),
  );
}