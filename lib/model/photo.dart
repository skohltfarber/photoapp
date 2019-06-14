// import 'package:meta/meta.dart';

class Photo {

  String id;
  String name;
  String imagePath;
  String createdBy;
  String added;
  String description;

  Photo({
    this.id, 
    this.name,
    this.imagePath,
    this.createdBy,
    this.added,
    this.description,
  });

  Photo.fromDb(Map json)
      : id = json["id"].toString(),
        name = json["name"],
        imagePath = json["imagePath"],
        createdBy = json["createdBy"],
        added = json["added"],
        description = json["description"];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['imagePath'] = imagePath;
    map['createdBy'] = createdBy;
    map['added'] = added;
    map['description'] = description;
    return map;
  }
}

final photos = [
  new Photo(
    id: "0", 
    name: "Sunset over a Lavender Field",
    imagePath: "assets/0.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/25/2019 3:00:00",
    description: "The purple from the field makes the sunset worth watching."
  ),
  new Photo(
    id: "1", 
    name: "Pool of Youth",
    imagePath: "assets/1.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "Ponce de Leon thought that the waters of a fountain would make you young. He really should have been looking in the mountains and for a pool of mountain water."
  ),
  new Photo(
    id: "2", 
    name: "Zoom Zoom Road",
    imagePath: "assets/2.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "The madza commerials had a tag line of zoom zoom. They must have tested their vehicles on this road."
  ),
  new Photo(
    id: "3", 
    name: "Fields with Insprational Tree",
    imagePath: "assets/3.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "Once a day, the tree lights up as the Sunrises through its leaves. It is the moment when you realize the blessing in your life. Fresh dew and a warm summers breeze tells you that God cares about you."
  ),
  new Photo(
    id: "4", 
    name: "Valley of Gold",
    imagePath: "assets/4.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "Treasurer hunters kill for this valley as they search in this life for Gold. They really need to take the time and enjoy the ride."
  ),
  new Photo(
    id: "5", 
    name: "Heat of the Day",
    imagePath: "assets/5.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "As the hot sun beats down on your head, you realize that you need to finish your farming chores. You wait as sweat drips down your brow.  You pray for a cool summer breeze."
  ),
  new Photo(
    id: "6", 
    name: "Journey Home",
    imagePath: "assets/6.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "You are in the middle of your journey home. Will you make it. You have been bit, chased and are almost out of food. Will you survive the treacherous journey home?"
  ),
  new Photo(
    id: "7", 
    name: "Waterfall of Doom",
    imagePath: "assets/7.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/26/2019 3:00:00",
    description: "Your body is bruised and beaten. You do not know how you have survived the drop of doom. Your memory of fall is forgotten. You walk speachless home."
  ),
  new Photo(
    id: "8", 
    name: "Crisp Misty Peaks",
    imagePath: "assets/8.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/21/2019 3:00:00",
    description: "A feeling comes upon your body. You are humbled by the 12 day hike. Will you ever have this feeling again?"
  ),
  new Photo(
    id: "9", 
    name: "Short walk off a Long Pier",
    imagePath: "assets/9.jpg",
    createdBy: "Shawn Kohltfarber",
    added: "8/22/2019 3:00:00",
    description: "This lake is full of fish. You sink a lure as you walk three feet. Your arms move back and forth as you catch an award winning fish."
  ),
];
