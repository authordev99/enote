import 'package:badges/badges.dart';
import 'package:enote/DetailPage.dart';
import 'package:enote/model/Lesson.dart';
import 'package:enote/model/Menu.dart';
import 'package:enote/model/Suggestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SelfDrvn(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {}
}

class SelfDrvn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Suggestion> getListSuggestion() {
      return [
        Suggestion(title:"Request Feedback!",description: "This description should have character limit",imageUrl: "images/working.jpg"),
        Suggestion(title:"Movie Night",description: "Joker Thinks It’s Saying Something, But Acts More Like a Class Clown",imageUrl: "images/joker.jpg"),
        Suggestion(title:"More Learning!",description: "Yesterday I was clever, so I changed the world",imageUrl: "images/learning.jpg"),
        Suggestion(title:"Lets Trip 2019!",description: "A journey is best measured in friends, rather than miles.",imageUrl: "images/team.jpg"),
        Suggestion(title:"Get Job Done!",description: "Success is how high you bounce when you hit bottom",imageUrl: "images/success.jpg"),
        Suggestion(title:"Request Feedback!",description: "This description should have character limit",imageUrl: "images/working.jpg"),
        Suggestion(title:"Movie Night",description: "Joker Thinks It’s Saying Something, But Acts More Like a Class Clown",imageUrl: "images/joker.jpg"),
        Suggestion(title:"More Learning!",description: "Yesterday I was clever, so I changed the world",imageUrl: "images/learning.jpg"),
      ];
    }
    List listItemSuggestion = getListSuggestion();


    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return CupertinoAlertDialog(
            title: new Text("Logout"),
            content: new Text("Are you sure want to logout?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog

              new FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("Logout"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromARGB(255, 67, 167, 180),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            Badge(
              badgeContent: Text('2', style: TextStyle(color: Colors.white)),
              child: IconButton(
                icon: Icon(Icons.blur_on, color: Colors.white),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );

    Card listSuggestion(Suggestion suggestion) => Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.black
                ]
              ),
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstIn),
                image: AssetImage(suggestion.imageUrl),
                fit: BoxFit.cover,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                suggestion.description,
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(suggestion.title,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ));


    List<Menu> getMenuSettings() {
      return [
        Menu(title: "Languages", iconData: Icons.language, badgeCount: ''),
        Menu(title: "Report", iconData: Icons.report, badgeCount: ''),
        Menu(title: "FAQ", iconData: Icons.feedback, badgeCount: ''),
        Menu(title: "Sign Out", iconData: Icons.close, badgeCount: '')
      ];
    }

    List<Menu> menuSettings = getMenuSettings();
    List<Widget> listMenuSettings = List<Widget>();
    for (var list in menuSettings) {
      listMenuSettings.add(Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Badge(
            badgeContent:
                Text(list.badgeCount, style: TextStyle(color: Colors.white)),
            showBadge: list.badgeCount != "" ? true : false,
            child: ClipOval(
              child: Material(
                color: Color.fromARGB(255, 67, 167, 180), // button color
                child: InkWell(
                  splashColor: Colors.transparent, // inkwell color
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Icon(list.iconData, color: Colors.white),
                  ),
                  onTap: () {
                    if (list.title == "Sign Out") {
                      _showDialog();
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5.0)),
          Text(list.title)
        ],
      ));
    }

    List<Menu> getMenuDashboard() {
      return [
        Menu(title: "Quest", iconData: Icons.mic, badgeCount: '20'),
        Menu(title: "Survey", iconData: Icons.access_alarm, badgeCount: ''),
        Menu(title: "Quiz", iconData: Icons.accessibility, badgeCount: ''),
        Menu(title: "Adhoc", iconData: Icons.cake, badgeCount: ''),
        Menu(title: "Recognize", iconData: Icons.call, badgeCount: ''),
        Menu(title: "MIB", iconData: Icons.star, badgeCount: '20'),
        Menu(title: "Redemp", iconData: Icons.redeem, badgeCount: ''),
        Menu(title: "More", iconData: Icons.more_horiz, badgeCount: '')
      ];
    }

    List<Menu> menuDashboard = getMenuDashboard();
    List<Widget> listMenuDashboard = List<Widget>();
    for (var list in menuDashboard) {
      listMenuDashboard.add(Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Badge(
            badgeContent:
                Text(list.badgeCount, style: TextStyle(color: Colors.white)),
            showBadge: list.badgeCount != "" ? true : false,
            child: ClipOval(
              child: Material(
                color: Color.fromARGB(255, 67, 167, 180), // button color
                child: InkWell(
                  splashColor: Colors.transparent, // inkwell color
                  child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(list.iconData, color: Colors.white)),
                  onTap: () {
                    if (list.title != "More") {
                      Fluttertoast.showToast(
                          msg: list.title,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 2,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
//                              height: size.height,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("More",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Padding(padding: EdgeInsets.only(bottom: 20)),
                                  Wrap(
                                    alignment: WrapAlignment.spaceEvenly,
                                    spacing: 40,
                                    runSpacing: 30.0,
                                    children: listMenuSettings,
                                  ),
//                                  Text("Settings",
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: 20)),
//                                  Wrap(
//                                    alignment: WrapAlignment.spaceEvenly,
//                                    spacing: 40,
//                                    runSpacing: 30.0,
//                                    children: listMenuSettings,
//                                  )
                                ],
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5.0)),
          Text(list.title)
        ],
      ));
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(expandedHeight: 250),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(padding: EdgeInsets.only(bottom: 100)),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 40,
                    runSpacing: 30.0,
                    children: listMenuDashboard,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("SUGGESTION FOR YOU",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 175,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext content, int index) {
                        return listSuggestion(listItemSuggestion[index+1]);
                      }),
                ),
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("SUGGESTION FOR YOU",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 175,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext content, int index) {
                        return listSuggestion(listItemSuggestion[index]);
                      }),
                ),
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("SUGGESTION FOR YOU",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 175,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext content, int index) {
                        return listSuggestion(listItemSuggestion[index+3]);
                      }),
                ),
                Padding(padding: EdgeInsets.only(bottom: 40))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: makeBottom,
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double boxHeight = 130;

  Column profile = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Hello", style: TextStyle(color: Colors.white)),
      Text(
        "Federico Julian Teddy",
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text("Rockstar", style: TextStyle(color: Colors.white))
    ],
  );

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 67, 167, 180),
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstIn),
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: (expandedHeight + boxHeight) / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: boxHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: new Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "RANK",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "120",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 67, 167, 180)),
                          ),
                          Text("+2 Rank", style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "POINT EARNED",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "120,000",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 67, 167, 180)),
                          ),
                          Text("+2000 Since last week",
                              style: TextStyle(color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: (expandedHeight + boxHeight) / 5 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                  children: <Widget>[
                    Hero(
                        tag: "image",
                        child: Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: new BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new NetworkImage(
                                        "https://steamuserimages-a.akamaihd.net/ugc/940573211737440191/BDFA2022BE1D420249B31AF05D0CDC2A70597B47/"))))),
                    Container(
                      padding: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: profile,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  List lessons;
//
//  @override
//  Widget build(BuildContext context) {
//    lessons = getLessons();
//
//    List<ListItem> items = new List();
//    items.add(HeadingItem(""));
//    items.add(HeadingItem("Ongoing"));
//    items.add(lessons[0]);
//    items.add(lessons[1]);
//    items.add(lessons[2]);
//    items.add(HeadingItem("Overdue"));
//    items.add(lessons[3]);
//    items.add(HeadingItem("Completed"));
//    items.add(lessons[4]);
//    items.add(lessons[5]);
//    items.add(lessons[6]);
//
//    Container makeTopContent() => Container(
//          decoration: BoxDecoration(color: Colors.white),
//          padding: EdgeInsets.all(20),
//          margin: EdgeInsets.only(bottom: 10),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              Column(
//                children: [
//                  Text('1', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//                  Text('Ongoing'),
//                ],
//              ),
//              Column(
//                children: [
//                  Text('13', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//                  Text('Overdue'),
//                ],
//              ),
//              Column(
//                children: [
//                  Text('123', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//                  Text('Completed'),
//                ],
//              ),
//            ],
//          ),
//        );
//
//    print('items ' + items.length.toString());
//    ListTile makeHeading(HeadingItem headingItem) => ListTile(
//          title: Text(
//            headingItem.heading,
//            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
//          ),
//        );
//
//    ListTile makeListTile(Lesson lesson) => ListTile(
//        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//        leading: Hero(
//            tag: "image" + lesson.level,
//            child: Container(
//                width: 50.0,
//                height: 50.0,
//                decoration: new BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: new DecorationImage(
//                        fit: BoxFit.cover,
//                        image: new NetworkImage(lesson.imageUrl))))),
//        title: Text(
//          lesson.title
//        ),
//        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//
//        subtitle: Row(
//          children: <Widget>[
//            Expanded(
//                flex: 1,
//                child: Container(
//                  // tag: 'hero',
//                  child: LinearProgressIndicator(
//                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//                      value: lesson.indicatorValue,
//                      valueColor: AlwaysStoppedAnimation(Colors.green)),
//                )),
//            Expanded(
//              flex: 4,
//              child: Padding(
//                  padding: EdgeInsets.only(left: 10.0),
//                  child: Text(lesson.level,
//                      style: TextStyle(color: Colors.white))),
//            )
//          ],
//        ),
//        trailing: Icon(Icons.keyboard_arrow_right, size: 30.0),
//        onTap: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => DetailPage(lesson: lesson)));
//        });
//
//    Card makeCard(Lesson lesson) => Card(
//          elevation: 8.0,
//          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//          child: Container(
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: new BorderRadius.circular(10)),
//            child: makeListTile(lesson),
//          ),
//        );
//
//    Container makeBody() => Container(
//          child: ListView.builder(
//            scrollDirection: Axis.vertical,
//            shrinkWrap: true,
//            itemCount: items.length,
//            itemBuilder: (BuildContext context, int index) {
//              final item = items[index];
//
//              if (index == 0) {
//                return makeTopContent();
//              }
//
//              if (item is HeadingItem) {
//                return makeHeading(item);
//              }
//              return makeCard(item);
//            },
//          ),
//        );
//
//    final makeBottom = Container(
//      height: 55.0,
//      child: BottomAppBar(
//        color: Colors.blue,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.home, color: Colors.white),
//              onPressed: () {},
//            ),
//            IconButton(
//              icon: Icon(Icons.blur_on, color: Colors.white),
//              onPressed: () {},
//            ),
//            IconButton(
//              icon: Icon(Icons.hotel, color: Colors.white),
//              onPressed: () {},
//            ),
//            IconButton(
//              icon: Icon(Icons.account_box, color: Colors.white),
//              onPressed: () {},
//            )
//          ],
//        ),
//      ),
//    );
//
//    final topAppBar = AppBar(
//      elevation: 0.1,
//      title: Text(widget.title),
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.list),
//          onPressed: () {},
//        )
//      ],
//    );
//
//    return Scaffold(
//      backgroundColor: Colors.grey[300],
//      appBar: topAppBar,
//      body: makeBody(),
//      bottomNavigationBar: makeBottom,
//      floatingActionButton: new FloatingActionButton(backgroundColor: Colors.blue,onPressed: null,child: Icon(Icons.add)),
//    );
//  }
//
//  List getLessons() {
//    return [
//      Lesson(
//          title: "Introduction to Driving",
//          level: "Beginner",
//          indicatorValue: 0.33,
//          price: 20,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
//          imageUrl:
//              "https://image.shutterstock.com/image-photo/passport-photo-portrait-asian-smiling-260nw-1041841363.jpg"),
//      Lesson(
//          title: "Observation at Junctions",
//          level: "Expert",
//          indicatorValue: 0.33,
//          price: 50,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
//          imageUrl:
//              "https://steamuserimages-a.akamaihd.net/ugc/940573211737440191/BDFA2022BE1D420249B31AF05D0CDC2A70597B47/"),
//      Lesson(
//          title: "Reverse parallel Parking",
//          level: "Intermidiate",
//          indicatorValue: 0.66,
//          price: 30,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
//          imageUrl:
//              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHLGl28MkC1mu0bBjdZv3110d042kDF3xbPQAqC1GMMvRLtlkDuQ"),
//      Lesson(
//          title: "Reversing around the corner",
//          level: "Newbie",
//          indicatorValue: 0.66,
//          price: 30,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
//          imageUrl:
//              "https://res.cloudinary.com/demo/image/upload/q_auto/woman.jpg"),
//      Lesson(
//          title: "Incorrect Use of Signal",
//          level: "Advanced",
//          indicatorValue: 1.0,
//          price: 50,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
//          imageUrl:
//              "https://www.samplestore.com/connect/sites/default/files/adelineprofile_0.png"),
//      Lesson(
//          title: "Engine Challenges",
//          level: "Master",
//          indicatorValue: 1.0,
//          price: 50,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
//          imageUrl:
//              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA1OhKzA7bVV-3UgDuSqxXxGlvyPjN0PFDtRPqCs90fG06IrHD"),
//      Lesson(
//          title: "Self Driving Car",
//          level: "Godlike",
//          indicatorValue: 1.0,
//          price: 50,
//          content:
//              "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ",
//          imageUrl:
//              "https://steamuserimages-a.akamaihd.net/ugc/940573211737440191/BDFA2022BE1D420249B31AF05D0CDC2A70597B47/")
//    ];
//  }
//}
