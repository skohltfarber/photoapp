import 'package:flutter/material.dart';

import 'package:photoapp/model/photo.dart';

class DetailPage extends StatefulWidget {
  final Photo photo;

  DetailPage({this.photo});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PhotoImage(widget.photo.imagePath),
                    PhotoTitle(widget.photo, 20.0),
                  ],
                ),
              ),
              expandedHeight: 340.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
            )
          ];
        },
        body: Container(
          child: DescriptionView(widget.photo.description),
        ),
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  final String description;

  DescriptionView(this.description);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: [
        Row(
          children: <Widget>[
            new SizedBox(width: 5.0),
            new Expanded(
              child: Text(description),
            ),
          ],
        ),
      ],
    );
  }
}

class PhotoImage extends StatelessWidget {
  final String imageURL;

  PhotoImage(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Image.asset(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}

class PhotoTitle extends StatelessWidget {
  final Photo photo;
  final double padding;

  PhotoTitle(this.photo, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            photo.name,
            style: Theme.of(context).textTheme.title,
          ),
          // Empty space:
          SizedBox(height: 10.0),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/profile2.jpg"),
            ),
            title: Text(photo.createdBy),
            subtitle: Text(photo.added),
          ),
        ],
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final Photo photo;

//   DetailPage({this.photo});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         title: Text(
//           "PHOTO DETAIL",
//           style: TextStyle(
//             color: Colors.purpleAccent,
//           ),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.only(left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Flexible(
//               flex: 5,
//               child: Container(
//                   margin: EdgeInsets.all(20),
//                   child: Image.asset(photo.imagePath,
//                       width: 300, height: 200, fit: BoxFit.fill)),
//             ),
//             Flexible(
//               flex: 1,
//               child: Container(
//                 width: 300,
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage("assets/profile2.jpg"),
//                   ),
//                   title: Text(photo.createdBy),
//                   subtitle: Text(photo.added),
//                 ),
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Container(
//                 width: 300,
//                 child: ListTile(
//                   title: Text(photo.name),
//                 ),
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Container(
//                 width: 300,
//                 child: ListTile(
//                   title: Text(photo.description),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
