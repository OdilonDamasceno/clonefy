import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'pages/initial/initial_page.dart';
import 'pages/library/library_page.dart';
import 'pages/search/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0, 0.3],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.purple[200].withAlpha(100), Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            InitialPage(),
            SearchPage(),
            LibraryPage(),
          ],
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return SizedBox(
              height: 108,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      border: Border.symmetric(
                        vertical: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Music name ° ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Artist name',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: controller.playPause,
                                child: Icon(
                                  controller.isPlay
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.skip_next,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    onTap: (index) {
                      controller.changeIndex(index);
                      _pageController.jumpToPage(index);
                    },
                    currentIndex: controller.index,
                    backgroundColor: Colors.grey[900],
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white,
                    selectedFontSize: 10,
                    unselectedFontSize: 10,
                    selectedIconTheme: IconThemeData(size: 26),
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), title: Text('Inicio')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search), title: Text('Buscar')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.list), title: Text('Sua Biblioteca'))
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
