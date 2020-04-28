import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      padding: EdgeInsets.only(top: 50),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Boa tarde',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 150,
                    height: 150,
                    color: Colors.white,
                    child: Icon(
                      Icons.music_note,
                      size: 50,
                    ),
                  ),
                  Text(
                    'Album $index\nArtista $index',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Tocadas Recentemente',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 150,
                    height: 150,
                    color: Colors.white,
                    child: Icon(
                      Icons.music_note,
                      size: 50,
                    ),
                  ),
                  Text(
                    'Album $index\nArtista $index',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'O melhor de cada artista',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 150,
                    height: 150,
                    color: Colors.white,
                    child: Icon(
                      Icons.music_note,
                      size: 50,
                    ),
                  ),
                  Text(
                    'Album $index\nArtista $index',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
