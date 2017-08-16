import 'package:flutter/material.dart';

class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> with TickerProviderStateMixin{
  int _currentPageIndex = 0;


  void _select(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              title: new Text('Editor'),
              icon: new Icon(Icons.create)
            ),
            new BottomNavigationBarItem(
              title: new Text('Favorites'),
              icon: new Icon(Icons.favorite)
            ),
            new BottomNavigationBarItem(
              title: new Text('Recents'),
              icon: new Icon(Icons.history)
            )
          ],
          onTap: _select,
          currentIndex: _currentPageIndex,
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: cards[_currentPageIndex],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
];

List<Widget> cards = <Widget>[
  new EditorPage(),
  new FavoritesPage(),
  new RecentsPage()
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => new _EditorPageState();
}

class _EditorPageState extends State<EditorPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Editor Page Here")
    );
  }
}


class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => new _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text('Favorite $index');
      },
    );
  }
}

class RecentsPage extends StatefulWidget {
  @override
  _RecentsPageState createState() => new _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text('Recents $index');
      },
    );
  }
}

void main() {
  runApp(new BasicAppBarSample());
}
