import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.green.withAlpha(200), Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: Modular.to.pop,
          ),
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text(
                'Tocando da sua biblioteca'.toUpperCase(),
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'Musicas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 100,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Music Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Album',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
                top: 20,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 3,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('06:35'),
                      Text('06:35'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shuffle),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 35,
                    icon: Icon(
                      Icons.skip_previous,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 70,
                    icon: Icon(
                      Icons.play_circle_filled,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 35,
                    icon: Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.repeat),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.devices_other),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.format_list_bulleted),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
