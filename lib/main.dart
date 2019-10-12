import 'package:badges/badges.dart';
import 'package:enote/DetailPage.dart';
import 'package:enote/model/Lesson.dart';
import 'package:enote/model/Menu.dart';
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
      home: MyHomePage(title: 'Goal Settings'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double appBarHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('size = ' + size.height.toString() + " " + size.width.toString());

    Column title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello", style: TextStyle(color: Colors.white)),
        Text(
          "Federico Julian Teddy",
          style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
        ),
        Text("Rockstar", style: TextStyle(color: Colors.white))
      ],
    );

    List<Menu> getMenu() {
      return [
        Menu(title: "Quest", iconData: Icons.mic),
        Menu(title: "Survey", iconData: Icons.access_alarm),
        Menu(title: "Quiz", iconData: Icons.accessibility),
        Menu(title: "Adhoc", iconData: Icons.cake),
        Menu(title: "Recognize", iconData: Icons.call),
        Menu(title: "MIB", iconData: Icons.star),
        Menu(title: "Redemption", iconData: Icons.redeem),
        Menu(title: "More", iconData: Icons.more_horiz)
      ];
    }

    List<Menu> menu = getMenu();

    List<Widget> menuItem = List<Widget>();
    for (var list in menu) {
      menuItem.add(Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Badge(
            badgeContent: Text('20',style: TextStyle(color: Colors.white)),
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
                    Fluttertoast.showToast(
                        msg: list.title,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 2,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0);
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

    Card listSuggestion() => Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10),
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstIn),
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text("This description should have characted limit"),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text("New Item Added!",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );

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
              badgeContent: Text('2',style: TextStyle(color: Colors.white)),
              child:  IconButton(
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


    return new Stack(
      children: <Widget>[
        new Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color.fromARGB(255, 67, 167, 180),
                  expandedHeight: 230.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstIn),
                              image: AssetImage("images/background.png"),
                              fit: BoxFit.cover)),
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                ),
              ];
            },
            body: Container(
              margin: EdgeInsets.only(top: 30),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: 40,
                        runSpacing: 30.0,
                        children: menuItem,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("SUGGETION FOR YOU",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 175,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext content, int index) {
                                    return listSuggestion();
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("SUGGETION FOR YOU",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 175,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext content, int index) {
                                    return listSuggestion();
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: makeBottom,
        ),
        new Positioned(
          child: new Card(
            color: Colors.transparent,
            elevation: 0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: "image",
                      child: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: new BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new NetworkImage(
                                      "https://steamuserimages-a.akamaihd.net/ugc/940573211737440191/BDFA2022BE1D420249B31AF05D0CDC2A70597B47/"))))),
                  Container(
                    padding: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: title,
                  )
                ],
              ),
            ),
          ),
          left: 10.0,
          right: 10.0,
          top: size.height * 0.09,
          bottom: size.height * 0.8,
        ),
        new Positioned(
          child: new Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10)),
                child: new Container(
                  padding: new EdgeInsets.all(30),
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
                            style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 67, 167, 180)),
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
                            style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 67, 167, 180)),
                          ),
                          Text("+2000 Since last week",
                              style: TextStyle(color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              )),
          left: 15.0,
          right: 15.0,
          top: size.height * 0.20,
          bottom: size.height * 0.63,
        )
      ],
    );
  }
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
