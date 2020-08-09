import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  
  final TextEditingController editingController = TextEditingController(); //not understood
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: screen.height * .175,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Music Player',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 35,
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  height: 50,
                  child: TextField(
                    onChanged: (value) {
        
                    },
                    controller: editingController, //not understood
                    decoration: InputDecoration(
                      labelText: "Search",
                      filled: true,
                      fillColor: Colors.grey[400],
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}