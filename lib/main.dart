import 'package:flutter/material.dart';
import 'package:photoapp/pages/detail.dart';

import 'model/photo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final List<Photo> _photos = photos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        // leading: Container(
        //   margin: EdgeInsets.only(left: 10),
        //   child: Icon(Icons.menu),
        // ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile2.jpg"),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Shawn Kohltfarber"),
              accountEmail: Text("Shawn.Kohltfarber@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/profile2.jpg"),
              ),
            ),
            ListTile(
              title: Text("About Me"),
              trailing: IconButton(
                icon: Icon(Icons.pages),
                onPressed: () {
                  _showDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
        height: 30.0,),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text("Explore"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       title: Text("My Page"),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Material(
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "PHOTOGRAPHY",
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(photo: _photos[index])),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex: 5,
                              child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Image.asset(_photos[index].imagePath,
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.fill)),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: 300,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/profile2.jpg"),
                                  ),
                                  title: Text(_photos[index].name),
                                  subtitle: Text(_photos[index].added),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "LANDSCAPES",
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    int id = _photos.length - index - 1;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(photo: _photos[id])),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex: 5,
                              child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Image.asset(_photos[id].imagePath,
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.fill)),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: 300,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/profile2.jpg"),
                                  ),
                                  title: Text(_photos[id].name),
                                  subtitle: Text(_photos[index].added),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("About Me"),
            content: Text("I really enjoy building mobile applications."),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"),
              )
            ],
          );
        });
  }
}
