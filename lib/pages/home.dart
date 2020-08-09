import 'package:flutter/material.dart';
import 'package:music_player/pages/menu.dart';
import 'package:music_player/pages/drashboard.dart';
import 'package:music_player/classes/file_info.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  bool inMenu = false;
  Map<String, List<File>> data; 
  Duration duration = Duration(milliseconds: 500);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;
  Animation<Offset> _slideAnimation;
  void refresh(){
    if (!inMenu){
      _controller.forward();
    }else{
      _controller.reverse();
    }
    setState(() {
      inMenu = !inMenu;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: .8).animate(_controller);
    _menuscaleAnimation = Tween<double>(begin: -.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0,0)).animate(_controller);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context).settings.arguments;
    // print(data);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: <Widget>[
          menu(context, _slideAnimation, _menuscaleAnimation),// ,data),
          dashboard(context, refresh, inMenu, duration, _scaleAnimation),
        ],
      ),
    );
  }
}

