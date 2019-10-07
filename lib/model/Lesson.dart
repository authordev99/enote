

// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class Lesson implements ListItem{
  String title;
  String level;
  double indicatorValue;
  int price;
  String content;
  String imageUrl;

  Lesson(
      {this.title, this.level, this.indicatorValue, this.price, this.content,this.imageUrl});
}