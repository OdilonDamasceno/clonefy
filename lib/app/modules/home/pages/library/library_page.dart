import 'package:flutter/material.dart';
import 'package:spotify_clone/app/utils/widgets/delegate/custom_delegate.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  TabController _tabAppBarController;
  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
    _tabAppBarController = TabController(
      vsync: this,
      length: 2,
    );
    super.initState();
  }

  List _tabs = <Widget>[
    Text(
      'Playlist',
      style: TextStyle(color: Colors.white),
    ),
    Text(
      'Artistas',
      style: TextStyle(color: Colors.white),
    ),
    Text(
      'Albuns',
      style: TextStyle(color: Colors.white),
    ),
  ];

  List _appBarTabs = <Widget>[
    Text(
      'Musicas',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Podcasts',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: CustomDetelage(
                extend: 70,
                child: TabBar(
                  controller: _tabAppBarController,
                  tabs: _appBarTabs,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomDetelage(
                extend: 50,
                color: Colors.grey[900],
                child: TabBar(
                  controller: _tabController,
                  tabs: _tabs,
                  indicatorColor: Colors.green,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 4,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ListTile(
                      leading:
                          Container(width: 50, height: 50, color: Colors.white),
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        'Playlist Title',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        'de Username',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
